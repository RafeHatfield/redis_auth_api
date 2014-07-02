require 'rails_helper'
require 'api/api_helper'

describe 'Redis Auth API' do
  before :each do
    @user = { login: 'FirstLast', password: 'password' }
  end

  describe 'post /create' do
    it 'should return 200 ok for unique and valid username' do
      api_post '/create', body: { login: @user[:login], password: @user[:password] }

      expect(response.status).to eq 200
      expect(REDIS.exists(@user[:login])).to eq true
      # password is hashed when stored
      expect(REDIS.get(@user[:login])).to_not eq @user[:password]
      password_hash = BCrypt::Password.new(REDIS.get(@user[:login]))
      expect(password_hash).to eq @user[:password]
    end

    it 'should be invalid with blank password' do
      @user[:password] = ''
      api_post '/create', body: { login: @user[:login], password: @user[:password] }

      expect(response.status).to eq 403
      expect(REDIS.exists(@user[:login])).to eq false
    end

    it 'should be invalid for non-unique usernames' do
      REDIS.set(@user[:login], @user[:password])

      api_post '/create', body: { login: @user[:login], password: @user[:password] }

      expect(response.status).to eq 403
    end
  end

  describe 'post /authenticate' do
    before :each do
      REDIS.set(@user[:login], BCrypt::Password.create(@user[:password]))
    end

    it 'should return 200 ok with valid credentials for a user' do
      api_post '/authenticate', body: { login: @user[:login], password: @user[:password] }

      expect(response.status).to eq 200
    end

    it 'should return 401 with invalid credentials for a user' do
      api_post '/authenticate', body: { login: @user[:login], password: 'that' }

      expect(response.status).to eq 401
    end

    it 'should return 401 with invalid credentials for a non-user' do
      api_post '/authenticate', body: { login: 'this', password: 'that' }

      expect(response.status).to eq 401
    end
  end
end
