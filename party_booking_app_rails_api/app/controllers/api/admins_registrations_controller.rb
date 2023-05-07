module Api
  class AdminsRegistrationsController < Api::BaseController
    # jitera-anchor-dont-touch: before_action_filter

    # jitera-index-anchor-dont-touch: actions

    # jitera-show-anchor-dont-touch: actions

    # jitera-create-anchor-dont-touch: actions
    def create
      admin_params = params.require(:admin).permit(:password, :password_confirmation, :name, :email)
      @admin = Admin.new(admin_params)
      if @admin.save
        head :ok
      else
        @error_message = @user.errors.full_messages.to_sentence
        @error_message = I18n.t('email_login.registrations.failed_to_sign_up') if @error_message.blank?
        render status: :unprocessable_entity
      end
    end

    # jitera-update-anchor-dont-touch: actions

    # jitera-destroy-anchor-dont-touch: actions

    # jitera-anchor-dont-touch: actions
  end
end
