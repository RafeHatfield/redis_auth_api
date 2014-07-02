class CreateUser
  def self.call(login, password)
    password_hash = BCrypt::Password.create(password)
    REDIS.set(login, password_hash)
  end
end
