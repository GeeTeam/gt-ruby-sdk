require 'sinatra'
require './geetest_ruby_sdk'

get '/' do
	send_file 'login.html'
end

post '/log' do
	challenge = params[:geetest_challenge] || ''
	validate = params[:geetest_validate] || ''
	seccode = params[:geetest_seccode] || ''

	sdk = GeetestSDK.new('ac0ebda33745de763940bc9693d2b31a')
	if sdk.validate(challenge, validate, seccode)
		'successfully'
	else 
		'Can not validate'
	end #if
end