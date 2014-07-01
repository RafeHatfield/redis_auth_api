class CreateUser
  def self.call(login, password)
    REDIS.set(login, password)
  end
end
