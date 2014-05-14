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
		'successfully'
	else 
		'Can not validate'
	end #if
end