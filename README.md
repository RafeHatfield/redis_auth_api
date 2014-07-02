Redis Auth Api
=========

[![Code Climate](https://codeclimate.com/github/RafeHatfield/redis_auth_api.png)](https://codeclimate.com/github/RafeHatfield/redis_auth_api)

Requirements

 * Create an API server in ruby (using Rails or Sinatra or similar) that provides an HTTP REST (JSON) Authentication API that could be used internally by other applications to authenticate users.
 * Uses Redis as the data store
 * Has a /create endpoint that receives a POST with a login and a password as a JSON body.   It will then save in its data store the login and password and respond with an HTTP 200.  It should require unique logins and non empty passwords.
 * Has an /authenticate endpoint that receives a POST with a login and password as a JSON body.  It will return an HTTP 200 or HTTP 401 based on whether the login and password match what is stored in the data store.
 * Dress it up with error checking, error responses should be in a JSON response body.
 * Make sure  this is secure (i.e. it'd pass a basic PCI DSS security review, though not necessary to worry about all the password rules).

Assumptions and Notes

 * for speed this is being built as a full stack rails app, in practice this would have been built using rails-api, or even sinatra for a simple app like this.
 * end points are /v1/create and /v1/authenticate to keep versioning, however as per spec have used rack-rewrite to make /create and /authenticate valid.
 * implemented using service objects to do the logic work, next refactor would incorporate a user poro
 * very basic rspec tests are implemented for outside-in dev process, 'rspec spec' to run (uses fakeredis gem so redis isn't needed to run test suite)

TODO:
 * investigate basic PCI DSS security reviews and make changes as required
