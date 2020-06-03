class Api::CollectionsController < Api::BaseController
  before_action :set_collection, only: [:show, :update]

  def index
    # binding.pry
    @collections = Collection.includes(:lists).where(user: current_user)

    json_response(
      @collections,
      include_data: [:lists]
    )
  end

  def show
    json_response(
      @collection,
      include_data: [:lists]
    )
  end

  def create
    create_params = collection_params.merge(user: current_user)
    service = Collections::CreateService.new(create_params)

    if service.call
      json_response(service.collection)
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  def update
    update_params = collection_params.merge(collection: @collection)
    service = Collections::UpdateService.new(update_params)

    if service.call
      json_response(service.collection)
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:name)
  end
end
