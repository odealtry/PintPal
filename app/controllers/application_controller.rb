class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :date_of_birth, :favourite_beer, :photo])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :date_of_birth, :photo])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def after_sign_in_path_for(user)
    map_path
  end

  def after_sign_out_path_for(user)
    map_path
  end

  def after_update_path_for(user)
    map_path
  end

end
