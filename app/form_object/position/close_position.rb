class Position::ClosePosition < ServiceBase
  def initialize(position:)
    @position = position
  end

  def perform
    @position.update!(status: 'closed', closing_date: Time.now.to_date)
    @error_message = "Error creating while closing position" unless @position.save
  end
end
