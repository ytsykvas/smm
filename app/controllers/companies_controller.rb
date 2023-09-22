class CompaniesController < ApplicationController
  def index
    @companies = policy_scope(Company)
  end

  def show
  end

  def new
    @company = Company.new
  end

  def edit
    company(params[:id])
  end

  def update
    company(params[:id])
    if @company.update(company_params)
      redirect_to companies_path, notice: t('company.updated_successfully')
    else
      render :edit
    end
  end

  def create
    create_service = Company::CreateCompany.new(params: params, user: current_user)
    if create_service.perform
      redirect_to companies_path, notice: t('company.created_successfully')
    else
      @company = create_service.company
      render :new
    end
  end

  def destroy
  end

  private

  def company_params
    params.require(:company).permit(:name, :social_id, :information, :started_at)
  end

  def company(id)
    @company ||= Company.find(id)
  end
end
