# Kuromi

[![Build Status](https://travis-ci.org/onthebeach/kuromi.png)](https://travis-ci.org/onthebeach/kuromi)

Kuromi is a command runner and a pretty DSL around your command line. It's basically a nice friendly way to interact with `Open3#popen3` from the standard library

## Installation

Add this line to your application's Gemfile:

    gem 'kuromi', github: 'onthebeach/kuromi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kuromi

## Usage

Commands are built using Runners. and can be built up in chains until they are finally executed with `#run`.

    output = Kuromi::Runner.for('hostname').run

You will end up with a Kuromi::Output object that you can use.

    output.code # => 0, the exit code of the process
    output.stdout # => Optional information from STDOUT
    output.stderr # => Optional information from STDERR

like most OnTheBeach projects, Kuromi is allergic to `nil` so where applicable (currently `stdout` and `stderr` do this) you will either get `Some[value]` or `None`. For the implementation of Optional Values see [the Optional gem here](http://github.com/rsslldnphy/optional)

You can pass extra arguments and build up command line chains with Kuromi using `#command`, `#with` and `#and`. For example

    Kuromi::Runner.for('git').
      command('rebase').
      with('--interactive').
      and('origin/master').
      run

## TODO

* Kuromi is synchronous - it will block while your command is being executed.
* Optional

## Contributing

Pull requests are welcome. Please ensure they're tested or we may reject them.

Run the tests as follows

    bundle exec rake

or with coverage

    COVERAGE=true bundle exec rake
