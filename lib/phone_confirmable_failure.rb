class PhoneConfirmableFailure < Devise::FailureApp
  def redirect_url
    (warden_message == :phone_should_be_confirmed) ? phone_confirmation_path(phone: params.try(:[], scope).try(:[], :phone)) : super
  end
end
