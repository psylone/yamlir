# YAMLir

YAMLir - is a simple library for generating folders structure in [YAML](http://www.yaml.org/) format. For example:

    books
    ├── architecture
    │   └── event-driven
    │       ├── event_driven_programming.pdf
    │       ├── eventmachine_introduction_10.pdf
    │       └── eventmachine_presentation.pdf
    ├── rails
    │   └── Rails.3.in.Action.pdf
    └── ruby
        ├── Design Patterns in Ruby.pdf
        └── RubyMethodLookupFlow.pdf

And the same structure with YAMLir:

    ---
    books:
      architecture:
        event-driven:
          event_driven_programming.pdf: 
          eventmachine_introduction_10.pdf: 
          eventmachine_presentation.pdf: 
      rails:
        Rails.3.in.Action.pdf: 
      ruby:
        Design Patterns in Ruby.pdf: 
        RubyMethodLookupFlow.pdf: 

## Installation

Add this line to your application's Gemfile:

    gem 'yamlir'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yamlir

## Usage

    YAMLir.generate

This code will create *yamlir.yml* file in the current directory with the recursive structure of it.

## Options

It's possible to change some things.

To change *<a href="http://en.wikipedia.org/wiki/Glob_(programming)">glob</a>* pattern:

    YAMLir.generate glob: "{app/{models},lib}/**/*"

For custom *output file* name (default is yamlir.yml):

    YAMLir.generate file: "result.yml"

For change *output directory* path (missing directories will be created):

    YAMLir.generate path: "/tmp/structure"

## Custom modes

### Foreword

YAMLir can be augmented by custom modes.

Originally this gem was conceived like a tool for generating a list of rails application files for subsequent marks those of them that have been tested and start the corresponding test suites. That's why YAMLir includes *RailsTestCover* mode which generates rails *app* directory structure and puts the result file (named *cover.yml*) in the *test* or *spec* folder. Later this idea was realized in a more general form with the possibility of adding custom modes.

### Create own mode

Suppose we want to create mode that generates all mp3 files under Music directory. This is it:

    # lib/yamlir/mode/mp3.rb

    module YAMLir

      class Mp3 < Base

        @glob = "/home/psylone/Music/**/*.{mp3}"
        @file = "mp3.yml"
        @path = "."

      end

    end

To generate YAML structure write:

    YAMLir::Mp3.generate

All this work can also be done using options with *YAMLir.generate* method.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
