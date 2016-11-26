# Geetest ruby sdk

Geetest是一个很不错的验证码组件，使用方便，安全性强。

## 安装

```ruby
gem 'gee_test'
```

然后执行:
```
$ bundle
```

或者通过gem安装:
```
$ gem install gee_test
```

## Rails 中使用

在 Rails 项目的 initilizer 中，添加 `geetest.rb`:

```ruby
require 'gee_test'

GeeTest.app_id = 'xxx'
GeeTest.app_key = 'xx'
```

在eruby中使用

```eruby
<%= GeeTest.gee_test_tag(product: 'embed') %>
```

在controller中验证
```ruby
if GeeTest.validate({
  geetest_challenge: params['geetest_challenge'],
  geetest_validate: params['geetest_validate'],
  geetest_seccode: params['geetest_seccode'],
})
  'successfully'
else 
  'Can not validate'
end
```


## 在sinatra项目中使用geetest

参考[demo](demo)

## 使用demo

```sh
cd demo
bundle
ruby app.rb
access localhost:4567 via your browser
```
