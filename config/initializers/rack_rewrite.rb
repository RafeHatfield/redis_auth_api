RedisAuthApi::Application.config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
  r307 %r{^/create(\?.*)?}, '/v1/create$1'
  r307 %r{^/authenticate(\?.*)?}, '/v1/authenticate$1'
end
