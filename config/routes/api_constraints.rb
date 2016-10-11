module Routes
  class ApiConstraints
    def initialize(options)
      @version = options[:version]
      @default = options[:default]
    end

    def matches?(request)
      @default || check_accept_header(request)
    end

    private

    def check_accept_header(request)
      request.headers
        .fetch(:accept, latest_version)
        .include?(vendor_accept_header(@version))
    end

    def vendor_accept_header(version)
      "application/vnd.orientation.v#{version}"
    end
  end
end
