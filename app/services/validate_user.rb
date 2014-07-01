class ValidateUser
  def self.call(login, password)
    errors = []
    errors << 'Failed; Login Exists' if REDIS.exists(login)
    errors << 'Failed; Password blank' if password.blank?
    errors
  end
end
