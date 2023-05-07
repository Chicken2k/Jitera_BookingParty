module Api
  class AdminsController < Api::BaseController
    # jitera-anchor-dont-touch: before_action_filter

    # jitera-index-anchor-dont-touch: actions
    def index
      @admins = AdminsService::Index.new(params.to_unsafe_h, current_user).execute
      @total_pages = @admins.total_pages
    end

    # jitera-show-anchor-dont-touch: actions
    def show
      @admin = Admin.find(params[:id])
      # show-authorization-code
    end

    # jitera-create-anchor-dont-touch: actions
    def create
      @admin = Admin.new(create_params)
      # create-authorization-code
      return if @admin.save

      @error_object = @admin.errors.full_messages
      render status: :unprocessable_entity
    end

    # jitera-update-anchor-dont-touch: actions
    def update
      @admin = Admin.find(params[:id])
      # update-authorization-code
      return if @admin.update(update_params)

      @error_object = @admin.errors.full_messages
      render status: :unprocessable_entity
    end

    # jitera-destroy-anchor-dont-touch: actions
    def destroy
      @admin = Admin.find(params[:id])
      # destroy-authorization-code
      if @admin.destroy
        head :ok
      else
        head :unprocessable_entity
      end
    end

    # jitera-anchor-dont-touch: actions

    private

    def update_params
      params.require(:admins).permit(:name, :email)
    end

    def create_params
      params.require(:admins).permit(:name, :email)
    end
  end
end
