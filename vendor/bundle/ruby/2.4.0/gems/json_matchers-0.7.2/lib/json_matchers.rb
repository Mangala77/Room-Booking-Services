require "json_matchers/version"
require "json_matchers/configuration"
require "json_matchers/matcher"
require "json_matchers/errors"

module JsonMatchers
  class << self
    attr_accessor :schema_root
  end

  self.schema_root = "#{Dir.pwd}/spec/support/api/schemas"

  def self.path_to_schema(schema_name)
    Pathname(schema_root).join("#{schema_name}.json")
  end
end
