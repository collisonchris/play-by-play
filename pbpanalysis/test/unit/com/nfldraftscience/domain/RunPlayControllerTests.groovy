package com.nfldraftscience.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(RunPlayController)
@Mock(RunPlay)
class RunPlayControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/runPlay/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.runPlayInstanceList.size() == 0
        assert model.runPlayInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.runPlayInstance != null
    }

    void testSave() {
        controller.save()

        assert model.runPlayInstance != null
        assert view == '/runPlay/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/runPlay/show/1'
        assert controller.flash.message != null
        assert RunPlay.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/runPlay/list'

        populateValidParams(params)
        def runPlay = new RunPlay(params)

        assert runPlay.save() != null

        params.id = runPlay.id

        def model = controller.show()

        assert model.runPlayInstance == runPlay
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/runPlay/list'

        populateValidParams(params)
        def runPlay = new RunPlay(params)

        assert runPlay.save() != null

        params.id = runPlay.id

        def model = controller.edit()

        assert model.runPlayInstance == runPlay
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/runPlay/list'

        response.reset()

        populateValidParams(params)
        def runPlay = new RunPlay(params)

        assert runPlay.save() != null

        // test invalid parameters in update
        params.id = runPlay.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/runPlay/edit"
        assert model.runPlayInstance != null

        runPlay.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/runPlay/show/$runPlay.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        runPlay.clearErrors()

        populateValidParams(params)
        params.id = runPlay.id
        params.version = -1
        controller.update()

        assert view == "/runPlay/edit"
        assert model.runPlayInstance != null
        assert model.runPlayInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/runPlay/list'

        response.reset()

        populateValidParams(params)
        def runPlay = new RunPlay(params)

        assert runPlay.save() != null
        assert RunPlay.count() == 1

        params.id = runPlay.id

        controller.delete()

        assert RunPlay.count() == 0
        assert RunPlay.get(runPlay.id) == null
        assert response.redirectedUrl == '/runPlay/list'
    }
}
