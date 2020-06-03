class Thoughts::UpdateService < BaseService
  attr_accessor :title
  attr_accessor :archived
  attr_accessor :status
  attr_accessor :date_completed
  attr_accessor :list_id

  attr_accessor :thought

  validates :thought, presence: true

  def call_after_validation
    update_thought

    valid?
  end

  def update_thought
    update_params = {
      title: @title,
      archived: @archived,
      status:  @status,
      date_completed: @date_completed,
      list_id: @list_id
      }

    @thought.update(update_params)
  end

  def valid?
    return false unless super

    clone_errors(@thought)

    @errors.empty?
  end
end
