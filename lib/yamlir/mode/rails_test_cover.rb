module YAMLir

  class RailsTestCover < Base

    @glob = "app/{controllers,helpers,mailers,models}/**/*"
    @file = "cover.yml"
    @path = Proc.new do
      Dir.exist?("spec") ? "spec" : "test"
    end

  end

end