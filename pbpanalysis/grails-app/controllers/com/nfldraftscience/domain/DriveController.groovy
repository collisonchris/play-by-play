package com.nfldraftscience.domain

import org.springframework.dao.DataIntegrityViolationException

class DriveController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [driveInstanceList: Drive.list(params), driveInstanceTotal: Drive.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[driveInstance: new Drive(params)]
			break
		case 'POST':
	        def driveInstance = new Drive(params)
	        if (!driveInstance.save(flush: true)) {
	            render view: 'create', model: [driveInstance: driveInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'drive.label', default: 'Drive'), driveInstance.id])
	        redirect action: 'show', id: driveInstance.id
			break
		}
    }

    def show() {
        def driveInstance = Drive.get(params.id)
        if (!driveInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'drive.label', default: 'Drive'), params.id])
            redirect action: 'list'
            return
        }

        [driveInstance: driveInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def driveInstance = Drive.get(params.id)
	        if (!driveInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'drive.label', default: 'Drive'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [driveInstance: driveInstance]
			break
		case 'POST':
	        def driveInstance = Drive.get(params.id)
	        if (!driveInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'drive.label', default: 'Drive'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (driveInstance.version > version) {
	                driveInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'drive.label', default: 'Drive')] as Object[],
	                          "Another user has updated this Drive while you were editing")
	                render view: 'edit', model: [driveInstance: driveInstance]
	                return
	            }
	        }

	        driveInstance.properties = params

	        if (!driveInstance.save(flush: true)) {
	            render view: 'edit', model: [driveInstance: driveInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'drive.label', default: 'Drive'), driveInstance.id])
	        redirect action: 'show', id: driveInstance.id
			break
		}
    }

    def delete() {
        def driveInstance = Drive.get(params.id)
        if (!driveInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'drive.label', default: 'Drive'), params.id])
            redirect action: 'list'
            return
        }

        try {
            driveInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'drive.label', default: 'Drive'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'drive.label', default: 'Drive'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
