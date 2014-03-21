Gem::Specification.new do |gem|
  gem.author      = 'Piotr Szotkowski'
  gem.description = 'An executable and a Ruby library for wrapping paragraphs of text.'
  gem.email       = 'chastell@chastell.net'
  gem.homepage    = 'http://github.com/chastell/lovely_rufus'
  gem.license     = 'AGPL-3.0'
  gem.name        = 'lovely_rufus'
  gem.summary     = 'lovely_rufus: text wrapper'
  gem.version     = '0.1.1'

  gem.files       = `git ls-files -z`.split "\0"
  gem.executables = gem.files.grep(%r{^bin/}).map { |path| File.basename path }
  gem.test_files  = gem.files.grep %r{^spec/.*\.rb$}

  gem.add_development_dependency 'bogus',          '~> 0.1.4'
  gem.add_development_dependency 'minitest',       '~> 5.0'
  gem.add_development_dependency 'minitest-focus', '~> 1.1'
  gem.add_development_dependency 'rake',           '~> 10.1'
  gem.add_development_dependency 'reek',           '~> 1.3'
  gem.add_development_dependency 'rerun',          '~> 0.9.0'
  gem.add_development_dependency 'rubocop',        '~> 0.19.0'
end
