class PhoneConfirmationsController < DeviseController
  before_filter :require_no_authentication

  def show ; end

  def create
    self.resource = resource_class.find_by(phone: params[:phone])
    if resource && resource.phone_confirmation_token == params[:token]
      resource.phone_confirm!
      flash[:success] = t('.user_phone_confirmed')
      redirect_to after_phone_confirmation_path_for
    elsif user
      flash[:error] = t('.invalid_token')
      render :show
    else
      flash[:error] = t('.user_not_found')
      render :show
    end
  end

protected

  def after_phone_confirmation_path_for
    new_resource_session_path(resource_class => { phone: params[:phone] })
  end
end
