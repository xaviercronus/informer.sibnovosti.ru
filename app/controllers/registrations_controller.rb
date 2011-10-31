class RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => :cancel
  load_and_authorize_resource :class => User, :instance_name => :user, :only => [:new, :create]
  
  def new
  end
  
  # POST /resource
    def create
      build_resource

      if resource.save
        if resource.active_for_authentication?
          set_flash_message :notice, :signed_up if is_navigational_format?
          respond_with resource, :location => after_sign_up_path_for(resource)
        else
          set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
          expire_session_data_after_sign_in!
          respond_with resource, :location => after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords(resource)
        respond_with_navigational(resource) { render_with_scope :new }
      end
    end
  
  protected
  
    def after_sign_up_path_for(resource)
      users_path
    end  

end
