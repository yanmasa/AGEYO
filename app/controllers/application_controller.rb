class ApplicationController < ActionController::Base

  # bofore_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    case resource
    when Contributor
      contributor_contributor_path(current_contributor)
    when Recipient
      recipient_path(current_recipient)
    end
  end
  # def configure_permitted_parameters
  # end

end
