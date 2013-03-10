package com.nfldraftscience.domain

import org.springframework.dao.DataIntegrityViolationException

class GameController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [gameInstanceList: Game.list(params), gameInstanceTotal: Game.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[gameInstance: new Game(params)]
			break
		case 'POST':
	        def gameInstance = new Game(params)
	        if (!gameInstance.save(flush: true)) {
	            render view: 'create', model: [gameInstance: gameInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'game.label', default: 'Game'), gameInstance.id])
	        redirect action: 'show', id: gameInstance.id
			break
		}
    }

    def show() {
        def gameInstance = Game.get(params.id)
        if (!gameInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'game.label', default: 'Game'), params.id])
            redirect action: 'list'
            return
        }

        [gameInstance: gameInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def gameInstance = Game.get(params.id)
	        if (!gameInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'game.label', default: 'Game'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [gameInstance: gameInstance]
			break
		case 'POST':
	        def gameInstance = Game.get(params.id)
	        if (!gameInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'game.label', default: 'Game'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (gameInstance.version > version) {
	                gameInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'game.label', default: 'Game')] as Object[],
	                          "Another user has updated this Game while you were editing")
	                render view: 'edit', model: [gameInstance: gameInstance]
	                return
	            }
	        }

	        gameInstance.properties = params

	        if (!gameInstance.save(flush: true)) {
	            render view: 'edit', model: [gameInstance: gameInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'game.label', default: 'Game'), gameInstance.id])
	        redirect action: 'show', id: gameInstance.id
			break
		}
    }

    def delete() {
        def gameInstance = Game.get(params.id)
        if (!gameInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'game.label', default: 'Game'), params.id])
            redirect action: 'list'
            return
        }

        try {
            gameInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'game.label', default: 'Game'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'game.label', default: 'Game'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
