class Api::Status < StandardError
  ERROR_OK            = 0
  ERROR_GENERAL       = 1
  ERROR_MISSING       = 2
  ERROR_ROUTING       = 3

  attr_accessor :code
  attr_accessor :message

  def initialize(options = {})
    super(options[:message])

    self.code    = options[:code]
    self.message = options[:message]
  end

  def self.from_exception(exception)
    return exception.instance_of?(Api::Status) ? 
            exception :
            general_error(exception.message)
  end

  # Factory
  def self.ok 
    return Api::Status.new(code: ERROR_OK, message: 'Ok')
  end

  def self.general_error(msg)
    return Api::Status.new(code: ERROR_GENERAL, message: msg)
  end

  def self.missing_param_error(param)
    return Api::Status.new(code: ERROR_MISSING, message: "Missing param #{param}" )
  end

  def self.routing_error
    return Api::Status.new(code: ERROR_ROUTING, message: 'Routing error' )
  end
end
