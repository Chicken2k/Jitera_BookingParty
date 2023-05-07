module Api
  class PartiesController < Api::BaseController
    # jitera-anchor-dont-touch: before_action_filter

    # jitera-index-anchor-dont-touch: actions
    def index
      @parties = PartiesService::Index.new(params.to_unsafe_h, current_user).execute
      @total_pages = @parties.total_pages
    end

    # jitera-show-anchor-dont-touch: actions
    def show
      @party = Party.find(params[:id])
      # show-authorization-code
    end

    # jitera-create-anchor-dont-touch: actions
    def create
      @party = Party.new(create_params)
      # create-authorization-code
      return if @party.save

      @error_object = @party.errors.full_messages
      render status: :unprocessable_entity
    end

    # jitera-update-anchor-dont-touch: actions
    def update
      @party = Party.find(params[:id])
      # update-authorization-code
      return if @party.update(update_params)

      @error_object = @party.errors.full_messages
      render status: :unprocessable_entity
    end

    # jitera-destroy-anchor-dont-touch: actions
    def destroy
      @party = Party.find(params[:id])
      # destroy-authorization-code
      if @party.destroy
        head :ok
      else
        head :unprocessable_entity
      end
    end

    # jitera-anchor-dont-touch: actions

    private

    def update_params
      params.require(:parties).permit(:nameparty, :partystarttime, :partylocation, :numberofpeople, :isstatus, :admin_id,
                                      :describe)
    end

    def create_params
      params.require(:parties).permit(:nameparty, :partystarttime, :partylocation, :numberofpeople, :isstatus, :admin_id,
                                      :describe)
    end
  end
end
