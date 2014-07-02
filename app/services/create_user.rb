class CreateUser
  def self.call(login, password)
    result = {}

    result[:message] = ValidateUser.call(login, password)
    result[:status] = 403

    if result[:message].blank?
      password_hash = BCrypt::Password.create(password)
      REDIS.set(login, password_hash)
      result[:message] = 'Success'
      result[:status] = 200
    end

    result
  end
end
