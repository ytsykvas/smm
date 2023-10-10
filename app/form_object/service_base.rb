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
end
