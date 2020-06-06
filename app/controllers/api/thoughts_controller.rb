class Api::ThoughtsController < Api::BaseController
  before_action :set_thought, only: [:update]

  def index
    @thoughts = Thought.where(user: current_user).order(updated_at: :desc)

    json_response(@thoughts)
  end

  def create
    create_params = thought_params.merge(user: current_user)

    service = Thoughts::CreateService.new(create_params)

    if service.call
      json_response(service.thought)
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  def update
    update_params = thought_params.merge(thought: @thought)
    service = Thoughts::UpdateService.new(update_params)

    if service.call
      json_response(service.thought)
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  private

  def set_thought
    @thought = Thought.find(params[:id])
  end

  def thought_params
    params.require(:thought).permit(
      :title,
      :archived,
      :status,
      :date_completed,
      :list_id
    )
  end
end
