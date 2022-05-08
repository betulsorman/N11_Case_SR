module BaseConfig

@environment = ENV['environment'] || 'prod'
def self.environment
  @environment
end

@wait_time = 20
def self.wait_time
  @wait_time
end

@browser = ENV['browser'] || 'chrome'
def self.browser
  @browser
end

case @environment
when 'regression'
  @env_url = 'regression-'
when 'test'
  @env_url = 'test-'
when 'prod'
  @env_url = ''
end

@url = "https://#{@env_url}www.n11.com.tr"
def self.url
  @url
end
end


