module YAMLir

  module SortedList

    module ClassMethods

      def sort list
        list.sort do |a, b|
          if slashes(a) == slashes(b)
            a <=> b
          else
            slashes(a) <=> slashes(b)
          end
        end
      end

      def slashes str
        str.split("").select{ |char| char == "/" }.count
      end
      private :slashes

    end

    extend ClassMethods

  end

end