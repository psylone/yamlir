require "set"
require "yaml"

module YAMLir

  class Base

    module ClassMethods

      def generate options = {}
        # TODO add options:
        #   recursive: "true or false recursive"
        #   folder_only: "get folders only"
        #   without_extensions: "true of false for extensions" There'll be problem for the folder with the same name as the file without extension
        #   store: true or false - store or not result in file
        @glob = options[:glob] || @glob
        @file = options[:file] || @file
        @path = options[:path] || @path
        store process Dir[@glob]
      end


      private

      def store result
        name = [@path, @file].join "/"
        File.open(name, "w"){ |f| f.write result }
      end

      def process list
        tree(seed list).to_yaml
      end

      def tree source
        Tree.new(source).growth
      end

      def seed list
        list = YAMLir::SortedList.sort(list)
        Set.new(list).classify{ |name| File.dirname(name) }
      end

    end

    extend ClassMethods

  end

end

# TODO make automation for requiring each mode
require "yamlir/mode/simple"
require "yamlir/mode/rails"