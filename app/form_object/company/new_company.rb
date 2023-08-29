class Company::NewCompany
  def initialize(params)
    @user = current_user
    @params = params
  end


end
