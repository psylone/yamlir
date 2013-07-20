module YAMLir

  class Tree

    def initialize source
      @source = source
      @purpose = {}
    end

    def growth
      for node, values in @source do create(node, values) end
      @purpose
    end


    private

    def create node, values
      node = node.split "/"
      traverse node, values
    end

    def traverse node, values
      current_branch = @purpose
      while node.length > 1
        key = node.shift
        current_branch.update key => {} unless current_branch[key]
        current_branch = current_branch[key]
      end
      add current_branch, node.shift, values
    end

    def add branch, node, values
      if node == "."
        values.each{ |leaf| branch.update File.basename(leaf) => nil unless branch[leaf] || @source.keys.include?(leaf) }
      else
        branch[node] = {} unless branch[node]
        values.each{ |leaf| branch[node].update File.basename(leaf) => nil unless @source.keys.include?(leaf) }
      end
    end

  end

end