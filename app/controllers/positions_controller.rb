class PositionsController < ApplicationController
  def index
    @open_positions = Position.where(status: 'open')
  end

  def show
    find_position
  end

  def new
    new_position
  end

  def edit
    find_position
  end

  def create
    create_position = Position::CreatePosition.new(params: position_params, user: current_user)
    if create_position.perform
      redirect_to positions_path, notice: t('positions.created_position_notice')
    else
      redirect_to new_position_path, notice: create_position.error_message.to_s
    end
  end

  def update
    if find_position.update(position_params)
      redirect_to position_path(@find_position), notice: t('positions.updated_position_notice')
    else
      render :edit, notice: t('usefully.check_fields_notice')
    end
  end

  def close_position
    close_position = Position::ClosePosition.new(position: find_position)
    if close_position.perform
      redirect_to positions_path, notice: t('positions.closed_position_notice')
    else
      render :show, notice: close_position.error_message.to_s
    end
  end

  private

  def new_position
    @position = Position.new
  end

  def find_position
    @find_position ||= Position.find(params[:id])
  end

  def position_params
    params.require(:position).permit(:title, :body, :experience, technology_ids: [])
  end
end
