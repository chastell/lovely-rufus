Gem::Specification.new do |gem|
  gem.name     = 'lovely-rufus'
  gem.version  = '0.0.2'
  gem.summary  = 'lovely-rufus: text wrapper'
  gem.homepage = 'http://github.com/chastell/lovely-rufus'
  gem.author   = 'Piotr Szotkowski'
  gem.email    = 'chastell@chastell.net'

  gem.files       = `git ls-files -z`.split "\0"
  gem.executables = gem.files.grep(%r{^bin/}).map { |path| File.basename path }
  gem.test_files  = gem.files.grep %r{^spec/.*\.rb$}

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'minitest', '>= 2.3'
  gem.add_development_dependency 'rake'
end
