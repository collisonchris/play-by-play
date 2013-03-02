package com.nfldraftscience.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(PassPlayController)
@Mock(PassPlay)
class PassPlayControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/passPlay/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.passPlayInstanceList.size() == 0
        assert model.passPlayInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.passPlayInstance != null
    }

    void testSave() {
        controller.save()

        assert model.passPlayInstance != null
        assert view == '/passPlay/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/passPlay/show/1'
        assert controller.flash.message != null
        assert PassPlay.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/passPlay/list'

        populateValidParams(params)
        def passPlay = new PassPlay(params)

        assert passPlay.save() != null

        params.id = passPlay.id

        def model = controller.show()

        assert model.passPlayInstance == passPlay
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/passPlay/list'

        populateValidParams(params)
        def passPlay = new PassPlay(params)

        assert passPlay.save() != null

        params.id = passPlay.id

        def model = controller.edit()

        assert model.passPlayInstance == passPlay
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/passPlay/list'

        response.reset()

        populateValidParams(params)
        def passPlay = new PassPlay(params)

        assert passPlay.save() != null

        // test invalid parameters in update
        params.id = passPlay.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/passPlay/edit"
        assert model.passPlayInstance != null

        passPlay.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/passPlay/show/$passPlay.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        passPlay.clearErrors()

        populateValidParams(params)
        params.id = passPlay.id
        params.version = -1
        controller.update()

        assert view == "/passPlay/edit"
        assert model.passPlayInstance != null
        assert model.passPlayInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/passPlay/list'

        response.reset()

        populateValidParams(params)
        def passPlay = new PassPlay(params)

        assert passPlay.save() != null
        assert PassPlay.count() == 1

        params.id = passPlay.id

        controller.delete()

        assert PassPlay.count() == 0
        assert PassPlay.get(passPlay.id) == null
        assert response.redirectedUrl == '/passPlay/list'
    }
}
