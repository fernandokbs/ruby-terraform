require 'json'

class << self
    attr_reader :resource

    def hash
        Hash.new
    end

    def variable(name, attributes = {})
        @resource ||= hash
        base = %{variable "#{name}"}
        @resource[base] = format(to_json(attributes))
    end    

    def provider(provider, attributes = {})
        @resource ||= hash
        base = %{provider "#{provider}"}
        @resource[base] = format(to_json(attributes))
    end

    def resource(type, name, attributes)
        @resource ||= hash
        base = %{resource "#{type}" "#{name}"}
        @resource[base] = format(to_json(attributes))
    end

    def to_json(attributes)
        JSON.pretty_generate(attributes , {indent: "  ", object_nl: "\n"})
    end

    def format(attributes)
        attributes.sub(","," ").gsub!(/: /, ' = ') << "\n\n"
    end

    def output
        output = ""

        @resource.each do |key, value|
            output << "#{key} #{value}"
        end

        output
    end
end