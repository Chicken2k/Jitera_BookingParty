module Api
  class PartybookingsController < Api::BaseController
    # jitera-anchor-dont-touch: before_action_filter

    # jitera-index-anchor-dont-touch: actions
    def index
      @partybookings = PartybookingsService::Index.new(params.to_unsafe_h, current_user).execute
      @total_pages = @partybookings.total_pages
    end

    # jitera-show-anchor-dont-touch: actions
    def show
      @partybooking = Partybooking.find(params[:id])
      # show-authorization-code
    end

    # jitera-create-anchor-dont-touch: actions
    def create
      @partybooking = Partybooking.new(create_params)
      # create-authorization-code
      return if @partybooking.save

      @error_object = @partybooking.errors.full_messages
      render status: :unprocessable_entity
    end

    # jitera-update-anchor-dont-touch: actions
    def update
      @partybooking = Partybooking.find(params[:id])
      # update-authorization-code
      return if @partybooking.update(update_params)

      @error_object = @partybooking.errors.full_messages
      render status: :unprocessable_entity
    end

    # jitera-destroy-anchor-dont-touch: actions
    def destroy
      @partybooking = Partybooking.find(params[:id])
      # destroy-authorization-code
      if @partybooking.destroy
        head :ok
      else
        head :unprocessable_entity
      end
    end

    # jitera-anchor-dont-touch: actions

    private

    def update_params
      params.require(:partybookings).permit(:user_id, :party_id)
    end

    def create_params
      params.require(:partybookings).permit(:user_id, :party_id)
    end
  end
end
