require 'sinatra'
require './geetest_ruby_sdk'

get '/' do
	send_file 'login.html'
end

post '/log' do
	challenge = params[:geetest_challenge] || ''
	validate = params[:geetest_validate] || ''
	seccode = params[:geetest_seccode] || ''

	sdk = GeetestSDK.new('0f1a37e33c9ed10dd2e133fe2ae9c459')
	if sdk.validate(challenge, validate, seccode)
		'验证码正确, 请进行下一步的验证 用户名和邮箱的工作'
	else
		'验证码不正确'
	end #if
end
