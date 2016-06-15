chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'hello-world', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/phone-number')(@robot)

  it 'responds to request for info about a phone number', ->
    expect(@robot.respond).to.have.been.calledWith(/phone 2565551234/i)
