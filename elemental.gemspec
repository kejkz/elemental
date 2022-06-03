Gem::Specification.new do |spec|
  spec.name = 'elemental'
  spec.required_ruby_version = '>= 2.5.0'
  spec.version = '0.0.1'
  spec.summary = 'Capybara elements wrapper'
  spec.description = 'Simple test automation, code sharing and manipulation with HTML elements'
  spec.authors = ['Vladimir Karan Grahovac']
  spec.email = 'kejkzz@gmail.com'
  spec.files = ['lib/elemental.rb']
  spec.homepage = 'https://rubygems.org/gems/elemental'
  spec.license = 'MIT'
  spec.add_runtime_dependency 'capybara', ['=> 3.0.0']
  spec.add_development_dependency 'rspec', ['>= 3.0']
end
