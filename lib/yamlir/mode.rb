require "set"
require "yaml"
require "fileutils"

module YAMLir

  class Base

    module ClassMethods

      def generate options = {}
        # TODO: Add options:
        #   recursive: "true or false recursive"
        #   folder_only: "get folders only"
        #   without_extensions: "true of false for extensions" There'll be problem for the folder with the same name as the file without extension
        #   store: true or false - store or not result in file
        @glob = normalize options[:glob] || @glob
        @file = normalize options[:file] || @file
        @path = normalize options[:path] || @path
        store process Dir[*@glob]
      end


      private

      def store result
        @path.chomp! "/"
        FileUtils.mkdir_p @path
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

      def normalize opt
        opt.is_a?(Proc) ? opt.call : opt
      end

    end

    extend ClassMethods

  end

end

Dir[File.expand_path("../mode", __FILE__).concat "/*.{rb}"].each{ |mode| require mode }