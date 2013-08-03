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

This code will create yamlir.yml file in the current directory with the recursive structure of it.

## Options

It's possible to change some things.

To change *<a href="http://en.wikipedia.org/wiki/Glob_(programming)">glob</a>* pattern:

    YAMLir.generate glob: "{app/{models},lib}/**/*"

For custom *output file* name (default is yamlir.yml):

    YAMLir.generate file: "result.yml"

For change *output directory* path (missing directories will be created):

    YAMLir.generate path: "/tmp/structure"

## Add custom modes

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
