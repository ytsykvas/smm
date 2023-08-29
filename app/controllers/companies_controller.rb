class CompaniesController < ApplicationController
  def index
    @companies = Company.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @company = Company.new
    @collection = Social.all.pluck(:name)
  end

  def create
    Company::CreateCompany.new(params, current_user).create_company

    redirect_to root_path, notice: t('company.created_successfully')
  end

  def destroy
  end
end
