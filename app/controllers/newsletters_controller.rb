class NewslettersController < ApplicationController
  def create
  	@newsletter = Newsletter.new(newsletter_params)
  	if @newsletter.save
  		cookies[:saved_newsletter] = true
  		redirect_to root_path
  	else
  		redirect_to root_path, alert: "Failed to subscribe"
  	end
  end

  def newsletter_params
  	params.require(:newsletter).permit(:email)
  end
end

