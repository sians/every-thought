class Api::ListsController < Api::BaseController
  before_action :set_list, only: [:show, :update]

  def index
    @lists = List.where(user: current_user)

    json_response(@lists)
  end

  def show
    json_response(
      @list,
      include_data: [:thoughts]
    )
  end

  def create
    create_params = list_params.merge(user: current_user)
    service = Lists::CreateService.new(create_params)

    if service.call
      json_response(service.list)
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  def update
    update_params = list_params.merge(list: @list, user: current_user)
    service = Lists::UpdateService.new(update_params)

    if service.call
      json_response(service.list)
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :collection_id)
  end
end
