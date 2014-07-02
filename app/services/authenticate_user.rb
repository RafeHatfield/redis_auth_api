class AuthenticateUser
  def self.call(login, password)
    result = {}
    password_hash = REDIS.get(login) ? BCrypt::Password.new(REDIS.get(login)) : nil

    if password_hash == password
      result[:message] = 'Authenticated'
      result[:status] = 200
    else
      result[:message] = 'Invalid credentials'
      result[:status] = 401
    end

    result
  end
end
