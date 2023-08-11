Gem::Specification.new do |s|
  s.name        = 'quelink-3xx'
  s.version     = '0.0.1'
  s.summary     = "Quelink devices command reader and writer"
  s.description = "Quelink devices command reader and writer"
  s.authors     = ["Stanislaw Zawadzki"]
  s.email       = 'st.zawadzki@gmail.com'
  s.license       = 'MIT'

  s.files = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']
  s.license       = 'MIT'
  s.add_development_dependency 'pry', '~> 0.13'
  s.add_development_dependency 'rspec', '~> 3.9'
end

