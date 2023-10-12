class CandidateMailer < ApplicationMailer
  default from: 'tsykvasyurii@gmail.com'
  def reply_email(candidate)
    @candidate = candidate
    mail(to: 'tsykvasyurii@gmail.com', subject: 'New candidate reply')
  end
end
