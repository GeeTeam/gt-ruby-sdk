module GeeTest
  module Configure

    mattr_accessor :app_id

    mattr_accessor :app_key

    mattr_accessor :validate_url
    self.validate_url = 'http://api.geetest.com/validate.php'
  end
end
