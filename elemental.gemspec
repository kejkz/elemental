Gem::Specification.new do |s|
  s.name = 'elemental'
  s.required_ruby_version = '>= 2.5.0'
  s.version = '0.0.1'
  s.summary = 'Capybara elements wrapper'
  s.description = 'Simple test automation, code sharing and manipulation with HTML elements'
  s.authors = ['Vladimir Karan Grahovac']
  s.email = 'kejkzz@gmail.com'
  s.files = ['lib/elemental.rb']
  s.homepage = 'https://rubygems.org/gems/elemental'
  s.license = 'MIT'
  s.add_runtime_dependency 'capybara', ['=> 3.0.0']
  s.add_development_dependency 'rspec', ['>= 3.0']
end
