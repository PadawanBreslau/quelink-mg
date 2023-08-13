# quelink-mg
Management of commands sent or received from QUELINK-300 device serie. Tested with MG-310 and MG-320

## Instalation

The quelink-mg gem is available at rubygems.org. You can install with:

`gem install quelink-mg`

Alternatively, you can install the gem with bundler:

\# Gemfile

`gem 'quelink-mg'`

After doing bundle install, you should have the gem installed in your bundle.

## Development

Building gem locally (you can change file name, ofc):
gem build *.gemspec -o pkg/quelink-mg.gem

Installing:
gem install pkg/quelink-mg.gem


