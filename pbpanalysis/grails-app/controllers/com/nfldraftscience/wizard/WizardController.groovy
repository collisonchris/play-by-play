package com.nfldraftscience.wizard

import com.nfldraftscience.domain.Play
import com.nfldraftscience.domain.PassPlay
import com.nfldraftscience.domain.RunPlay

class WizardController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']
    
    def index() { 
        redirect action: 'create', params: params
    }
    
    def create() {
        switch (request.method) {
            case 'GET':
                println("get hit")
                [runPlayInstance: new RunPlay(params)]
                [passPlayInstance: new PassPlay(params)]
                break
            case 'POST':
                //def playInstance = new Play(params)
                println(params.keySet())
            
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
    
    
}
