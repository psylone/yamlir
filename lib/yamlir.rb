require "yamlir/sorted_list"
require "yamlir/tree"
require "yamlir/mode"
require "yamlir/version"

module YAMLir

  def self.generate options = {}
    Simple.generate options
  end

  # def self.register! options
    # TODO register new mode
    #
    # YAMLir.register! name: "Sinatra", glob: "", file: "", path: ""
  # end

end