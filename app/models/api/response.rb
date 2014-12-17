class Api::Response
  attr_accessor :document
  attr_accessor :status

  def initialize(options = {}) 
    self.document = options[:document]
    self.status = options[:status] ||  Api::Status.ok 
  end
end
