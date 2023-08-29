class CompaniesController < ApplicationController
  def index
    @companies = Company.where(user_id: current_user.id)
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end
end
