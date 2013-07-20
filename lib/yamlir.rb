require "set"
require "yaml"
require "yamlir/tree"
require "yamlir/version"

module YAMLir

  module ClassMethods

    def generate options = {}
      # TODO add options:
      #   path: "for custom path"
      #   recursive: "true or false recursive"
      #   folder_only: "get folders only"
      #   without_extensions: "true of false for extensions"
      process Dir["**/*"].sort
    end


    private

    # def path
    #   @config.path
    # end

    def process list
      tree(seed list).to_yaml
    end

    def tree source
      Tree.new(source).growth
    end

    def seed list
      list = list.sort do |a, b|
        if slash(a) == slash(b)
          a <=> b
        else
          slash(a) <=> slash(b)
        end
      end
      Set.new(list).classify{ |name| File.dirname(name) }
    end

    def slash str
      str.split("").select{ |char| char == "/" }.count
    end

  end

  extend ClassMethods

end

# spec/cover.yml
# test/cover.yml
# YAMLir::Rails.generate
# YAMLir.generate

# YAMLir.generate path: "lib"
