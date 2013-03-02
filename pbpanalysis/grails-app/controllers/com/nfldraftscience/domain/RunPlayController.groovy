package com.nfldraftscience.domain

import org.springframework.dao.DataIntegrityViolationException

class RunPlayController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [runPlayInstanceList: RunPlay.list(params), runPlayInstanceTotal: RunPlay.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[runPlayInstance: new RunPlay(params)]
			break
		case 'POST':
	        def runPlayInstance = new RunPlay(params)
	        if (!runPlayInstance.save(flush: true)) {
	            render view: 'create', model: [runPlayInstance: runPlayInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'runPlay.label', default: 'RunPlay'), runPlayInstance.id])
	        redirect action: 'show', id: runPlayInstance.id
			break
		}
    }

    def show() {
        def runPlayInstance = RunPlay.get(params.id)
        if (!runPlayInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'runPlay.label', default: 'RunPlay'), params.id])
            redirect action: 'list'
            return
        }

        [runPlayInstance: runPlayInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def runPlayInstance = RunPlay.get(params.id)
	        if (!runPlayInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'runPlay.label', default: 'RunPlay'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [runPlayInstance: runPlayInstance]
			break
		case 'POST':
	        def runPlayInstance = RunPlay.get(params.id)
	        if (!runPlayInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'runPlay.label', default: 'RunPlay'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (runPlayInstance.version > version) {
	                runPlayInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'runPlay.label', default: 'RunPlay')] as Object[],
	                          "Another user has updated this RunPlay while you were editing")
	                render view: 'edit', model: [runPlayInstance: runPlayInstance]
	                return
	            }
	        }

	        runPlayInstance.properties = params

	        if (!runPlayInstance.save(flush: true)) {
	            render view: 'edit', model: [runPlayInstance: runPlayInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'runPlay.label', default: 'RunPlay'), runPlayInstance.id])
	        redirect action: 'show', id: runPlayInstance.id
			break
		}
    }

    def delete() {
        def runPlayInstance = RunPlay.get(params.id)
        if (!runPlayInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'runPlay.label', default: 'RunPlay'), params.id])
            redirect action: 'list'
            return
        }

        try {
            runPlayInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'runPlay.label', default: 'RunPlay'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'runPlay.label', default: 'RunPlay'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
