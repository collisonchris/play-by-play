package com.nfldraftscience.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(DriveController)
@Mock(Drive)
class DriveControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/drive/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.driveInstanceList.size() == 0
        assert model.driveInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.driveInstance != null
    }

    void testSave() {
        controller.save()

        assert model.driveInstance != null
        assert view == '/drive/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/drive/show/1'
        assert controller.flash.message != null
        assert Drive.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/drive/list'

        populateValidParams(params)
        def drive = new Drive(params)

        assert drive.save() != null

        params.id = drive.id

        def model = controller.show()

        assert model.driveInstance == drive
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/drive/list'

        populateValidParams(params)
        def drive = new Drive(params)

        assert drive.save() != null

        params.id = drive.id

        def model = controller.edit()

        assert model.driveInstance == drive
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/drive/list'

        response.reset()

        populateValidParams(params)
        def drive = new Drive(params)

        assert drive.save() != null

        // test invalid parameters in update
        params.id = drive.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/drive/edit"
        assert model.driveInstance != null

        drive.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/drive/show/$drive.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        drive.clearErrors()

        populateValidParams(params)
        params.id = drive.id
        params.version = -1
        controller.update()

        assert view == "/drive/edit"
        assert model.driveInstance != null
        assert model.driveInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/drive/list'

        response.reset()

        populateValidParams(params)
        def drive = new Drive(params)

        assert drive.save() != null
        assert Drive.count() == 1

        params.id = drive.id

        controller.delete()

        assert Drive.count() == 0
        assert Drive.get(drive.id) == null
        assert response.redirectedUrl == '/drive/list'
    }
}
