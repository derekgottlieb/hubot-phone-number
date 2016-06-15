# Description:
#   Grab info about a phone number
#
# Commands:
#   hubot phone # - Return info about a phone number
#
# Dependencies:
#   phone-number-validation@0.3.1
#
# Notes:
#   Expects env var HUBOT_NUMVERIFY_APIKEY to contain numverify API key

NUMVERIFY = require('phone-number-validation');

module.exports = (robot) ->
  #robot.respond /phone [0-9]{10}/i, (res) ->
  robot.respond /phone (.*)/i, (res) ->
    api = new NUMVERIFY({
        access_key: process.env.HUBOT_NUMVERIFY_APIKEY,
        secure: false # free API creds are HTTP only
      })
    console.log res.match[1]
    query = { number: "+1" + res.match[1] }
    api.validate(query, (err, result) ->
      if (err)
        return console.log('Validate Callback (Error): ' + JSON.stringify(err))
      console.log('Validate Callback (Success): ' + JSON.stringify(result))
      res.send JSON.stringify(result, null, 2)
    )
