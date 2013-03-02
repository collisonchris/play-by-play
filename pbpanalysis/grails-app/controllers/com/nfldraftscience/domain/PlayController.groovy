package com.nfldraftscience.domain

import org.springframework.dao.DataIntegrityViolationException

class PlayController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [playInstanceList: Play.list(params), playInstanceTotal: Play.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[playInstance: new Play(params)]
			break
		case 'POST':
	        def playInstance = new Play(params)
	        if (!playInstance.save(flush: true)) {
	            render view: 'create', model: [playInstance: playInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'play.label', default: 'Play'), playInstance.id])
	        redirect action: 'show', id: playInstance.id
			break
		}
    }

    def show() {
        def playInstance = Play.get(params.id)
        if (!playInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'play.label', default: 'Play'), params.id])
            redirect action: 'list'
            return
        }

        [playInstance: playInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def playInstance = Play.get(params.id)
	        if (!playInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'play.label', default: 'Play'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [playInstance: playInstance]
			break
		case 'POST':
	        def playInstance = Play.get(params.id)
	        if (!playInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'play.label', default: 'Play'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (playInstance.version > version) {
	                playInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'play.label', default: 'Play')] as Object[],
	                          "Another user has updated this Play while you were editing")
	                render view: 'edit', model: [playInstance: playInstance]
	                return
	            }
	        }

	        playInstance.properties = params

	        if (!playInstance.save(flush: true)) {
	            render view: 'edit', model: [playInstance: playInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'play.label', default: 'Play'), playInstance.id])
	        redirect action: 'show', id: playInstance.id
			break
		}
    }

    def delete() {
        def playInstance = Play.get(params.id)
        if (!playInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'play.label', default: 'Play'), params.id])
            redirect action: 'list'
            return
        }

        try {
            playInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'play.label', default: 'Play'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'play.label', default: 'Play'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
