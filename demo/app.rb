require 'sinatra'
require 'gee_test'

GeeTest.app_id = 'd12db4f4558502e74222f98b61935884'
GeeTest.app_key = ''

get '/' do
  send_file 'login.html'
end

post '/log' do
  if GeeTest.validate({
    geetest_challenge: params['geetest_challenge'],
    geetest_validate: params['geetest_validate'],
    geetest_seccode: params['geetest_seccode'],
  })
    'successfully'
  else 
    'Can not validate'
  end
end
