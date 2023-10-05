Given(/^We have a user. It is (.*?)$/) do |user_type|
  @user = FactoryBot.create(:user, user_type:)
end
