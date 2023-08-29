class Company::CreateCompany
  def initialize(params, user)
    @params = params
    @user = user
  end

  def create_company
    company = Company.create(name: @params[:company][:name],
                             social_id: @params[:company][:social_id],
                             information: @params[:company][:information],
                             user: @user)
    Company.last.update!(started_at: Time.now) if company.save
  end
end
