class ServiceBase
  attr_reader :error_message

  def self.call(**args)
    service = self.new
    service.perform!(**args)
    service.result
  end

  def result
    @result ||= OpenStruct.new
  end

  def add_error_message(message)
    @error_message = message
  end

  def error?
    !@error_message.nil?
  end
end
