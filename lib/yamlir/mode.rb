module YAMLir

  class Base

    module ClassMethods

      def generate options = {}
        # TODO add options:
        #   path: "for custom path"
        #   recursive: "true or false recursive"
        #   folder_only: "get folders only"
        #   without_extensions: "true of false for extensions" There'll be problem for the folder with the same name as the file without extension
        process Dir["**/*"]
      end


      private

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