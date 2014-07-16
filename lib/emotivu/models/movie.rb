class Movie
    attr_reader :name
    def initialize(args = {})
        args.each { |k,v| instance_variable_set("@#{k}", v) }
    end

    def create
    end
end
