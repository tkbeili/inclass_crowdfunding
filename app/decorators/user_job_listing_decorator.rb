class UserJobListingDecorator < Draper::Decorator

  def initialize(user, job_listing)
    @user = user
    @job_listing = job_listing
  end

  def apply_button

  end

end