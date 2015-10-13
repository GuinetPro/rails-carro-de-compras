class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #metodos que se dispara antes que device mande el formualrio
  #before_action :configure_permitted_parameters
  protect_from_forgery with: :exception
  # incluimos public activity
  include PublicActivity::StoreController

"""
  protected

  def configure_permitted_parameters

    if ( self.class >= Devise::RegistrationsController)
        self.class.send(:define_method, :resource_params) do
            params.require(resource_name).permit(:email,:password,:password_confirmation,:username)
        end
    end

  end
"""
end
