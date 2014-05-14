Geetest ruby sdk
================

Geetest是一个很不错的验证码组件，使用方便，安全性强。可惜没有ruby的sdk。于是顺手写了一个，由于实在太简单，所以没有做成gem，只留下实现和demo自取。


## 如何使用demo
  
```
git clone  
cd geetest_ruby_sdk
bundle 
ruby geetest.rb
access localhost:4567 via your browser
```

## 如何在rails项目中使用geetest 

将geetest_ruby_sdk.rb拷贝至lib目录

```html
在view页面加上
<script type="text/javascript" src="http://api.geetest.com/get.php?gt=id"></script>
```
其中id为geetest的公钥，这是要注册后才能得到的

```ruby
# in your controller action

require 'geetest_ruby_sdk'

challenge = params[:geetest_challenge] || ''
validate = params[:geetest_validate] || ''
seccode = params[:geetest_seccode] || ''

# 将私钥传入，要注册的
sdk = GeetestSDK.new('private key')
if sdk.validate(challenge, validate, seccode)
	do something
else 
	do something
end #if
```

## 如何在sinatra项目中使用geetest 

将geetest_ruby_sdk.rb拷贝至当前路径

```ruby
# app.rb
require 'sinatra'
require './geetest_ruby_sdk'

get '/' do
	send_file 'login.html'
end

post '/log' do
	challenge = params[:geetest_challenge] || ''
	validate = params[:geetest_validate] || ''
	seccode = params[:geetest_seccode] || ''

	# 将私钥传入，要注册的
	sdk = GeetestSDK.new('private key')
	if sdk.validate(challenge, validate, seccode)
		'successfully'
	else 
		'Can not validate'
	end #if
end
```
  

