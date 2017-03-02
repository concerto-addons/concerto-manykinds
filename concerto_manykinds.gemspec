$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'concerto_manykinds/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'concerto_manykinds'
  s.version     = ConcertoManykinds::VERSION
  s.authors     = ['Marvin Frederickson']
  s.email       = ['marvin.frederickson@gmail.com']
  s.homepage    = 'https://github.com/concerto-addons/concerto-manykinds'
  s.summary     = 'Allow multiple kinds (content types) per template field'
  s.description = 'Display multiple types of content in the same template field in Concerto.'

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails'

  s.add_development_dependency 'sqlite3'
end
