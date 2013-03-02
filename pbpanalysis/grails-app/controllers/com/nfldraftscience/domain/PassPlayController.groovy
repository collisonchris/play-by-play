package com.nfldraftscience.domain

import org.springframework.dao.DataIntegrityViolationException

class PassPlayController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [passPlayInstanceList: PassPlay.list(params), passPlayInstanceTotal: PassPlay.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[passPlayInstance: new PassPlay(params)]
			break
		case 'POST':
	        def passPlayInstance = new PassPlay(params)
	        if (!passPlayInstance.save(flush: true)) {
	            render view: 'create', model: [passPlayInstance: passPlayInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'passPlay.label', default: 'PassPlay'), passPlayInstance.id])
	        redirect action: 'show', id: passPlayInstance.id
			break
		}
    }

    def show() {
        def passPlayInstance = PassPlay.get(params.id)
        if (!passPlayInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'passPlay.label', default: 'PassPlay'), params.id])
            redirect action: 'list'
            return
        }

        [passPlayInstance: passPlayInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def passPlayInstance = PassPlay.get(params.id)
	        if (!passPlayInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'passPlay.label', default: 'PassPlay'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [passPlayInstance: passPlayInstance]
			break
		case 'POST':
	        def passPlayInstance = PassPlay.get(params.id)
	        if (!passPlayInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'passPlay.label', default: 'PassPlay'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (passPlayInstance.version > version) {
	                passPlayInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'passPlay.label', default: 'PassPlay')] as Object[],
	                          "Another user has updated this PassPlay while you were editing")
	                render view: 'edit', model: [passPlayInstance: passPlayInstance]
	                return
	            }
	        }

	        passPlayInstance.properties = params

	        if (!passPlayInstance.save(flush: true)) {
	            render view: 'edit', model: [passPlayInstance: passPlayInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'passPlay.label', default: 'PassPlay'), passPlayInstance.id])
	        redirect action: 'show', id: passPlayInstance.id
			break
		}
    }

    def delete() {
        def passPlayInstance = PassPlay.get(params.id)
        if (!passPlayInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'passPlay.label', default: 'PassPlay'), params.id])
            redirect action: 'list'
            return
        }

        try {
            passPlayInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'passPlay.label', default: 'PassPlay'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'passPlay.label', default: 'PassPlay'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
