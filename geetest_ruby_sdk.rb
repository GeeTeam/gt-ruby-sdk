require 'digest'
require 'net/http'

class GeetestSDK
	def initialize(key, new_uri=nil)
		@gee_uri = new_uri || 'http://api.geetest.com/validate.php'
		@key = key
	end

	def validate(challenge='', validate='', seccode='')
		md5 = Digest::MD5.hexdigest(@key + 'geetest' + challenge)
		if validate == md5
			back = post(@gee_uri, seccode: seccode) rescue ''
			if back == Digest::MD5.hexdigest(seccode)
				return true
			else 
				return false
			end #if
		else
			return false
		end #if
	end #geetest_validate

	# data.is_a?(Hash)==true
	def post(uri, data)
		uri = URI(uri)
		res = Net::HTTP.post_form(uri, data)
		res.body
	end

end

