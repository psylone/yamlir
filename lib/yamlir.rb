require "set"
require "yaml"
require "yamlir/sorted_list"
require "yamlir/tree"
require "yamlir/mode"
require "yamlir/version"

module YAMLir

  def self.generate options = {}
    Simple.generate options
  end

end

# spec/cover.yml
# test/cover.yml
# YAMLir::Rails.generate
# YAMLir.generate

# YAMLir.generate path: "lib"
