class Company::CreateCompany < ServiceBase
  attr_reader :company, :user

  def initialize(params:, user:)
    @params = params
    @user = user
    @company = nil
  end

  def perform
    build_company
    return false unless validate_company

    save_company
  end

  private

  def build_company
    @company = ::Company.new(@params.require(:company).permit(:name, :social_id, :information, :started_at))
    @company.user = user
  end

  def validate_company
    @company.valid?
  end

  def save_company
    if @company.save
      @company.update!(started_at: Time.now)
      true
    else
      false
    end
  end
end
