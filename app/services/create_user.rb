class CreateUser
  def self.call(login, password)
    result = {}

    result[:errors] = ValidateUser.call(login, password)

    if result[:errors].blank?
      password_hash = BCrypt::Password.create(password)
      REDIS.set(login, password_hash)
      result[:status] = 200
    else
      result[:status] = 403
    end

    result
  end
end
