class CareersController < ApplicationController
  def index
    @open_positions = Position.where(status: 'open')
  end

  def new
    @position = Position.new
  end

  def show
  end

  def create
    @position = Position.new(position_params)
    if @position.save
      redirect_to careers_path, notice: 'Position created successfully.'
    else
      render :new
    end
  end

  def destroy
  end

  private

  def position_params
    params.require(:position).permit(:title, :body, :technologies)
  end
end
