class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :set_layout

  protected

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :email, :password, :password_confirmation, :remember_me,
                   :visa_id, :country_id, :state_id, :sex, :birthday, :agree, :news_letter]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, notice: exception.message
  end

  def is_public_controller?
    self.class == Devise::SessionsController or
        self.class == Devise::PasswordsController
  end

  def set_layout
    if is_public_controller?
      "devise"
    else
      if self.class == IndexController
        "cuongplus"
      else
        "application"
      end
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def ckeditor_pictures_scope(options = { :id => params[:column_id]})
    ckeditor_filebrowser_scope(options)
  end

  def after_sign_in_path_for(resource)
    super_dashboard_messages_path
  end
end
