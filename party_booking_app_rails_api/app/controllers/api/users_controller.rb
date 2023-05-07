module Api
  class UsersController < Api::BaseController
    # jitera-anchor-dont-touch: before_action_filter

    # jitera-index-anchor-dont-touch: actions
    def index
      @users = UsersService::Index.new(params.to_unsafe_h, current_user).execute
      @total_pages = @users.total_pages
    end

    # jitera-show-anchor-dont-touch: actions
    def show
      @user = User.find(params[:id])
      # show-authorization-code
    end

    # jitera-create-anchor-dont-touch: actions
    def create
      @user = User.new(create_params)
      # create-authorization-code
      return if @user.save

      @error_object = @user.errors.full_messages
      render status: :unprocessable_entity
    end

    # jitera-update-anchor-dont-touch: actions
    def update
      @user = User.find(params[:id])
      # update-authorization-code
      return  if @user.update(update_params)

      @error_object = @user.errors.full_messages
      render status: :unprocessable_entity
    end

    # jitera-destroy-anchor-dont-touch: actions
    def destroy
      @user = User.find(params[:id])
      # destroy-authorization-code
      if @user.destroy
        head :ok
      else
        head :unprocessable_entity
      end
    end

    # jitera-anchor-dont-touch: actions

    private

    def update_params
      params.require(:users).permit(:name, :isactive, :username, :dateofbirth, :email)
    end

    def create_params
      params.require(:users).permit(:name, :isactive, :username, :dateofbirth, :email)
    end
  end
end
