class Thoughts::CreateService < BaseService
  attr_accessor :title
  attr_accessor :user
  attr_accessor :archived
  attr_accessor :status
  attr_accessor :date_completed
  attr_accessor :list_id

  attr_accessor :thought

  validates :title, presence: true
  validates :user, presence: true
  validates :list_id, presence: true

  def call_after_validation
    create_thought

    valid?
  end

  def create_thought
    @list = List.where(user: @user).find(@list_id)

    @thought = Thought.create(
      title: @title,
      archived: false,
      status: 0,
      user: @user,
      list: @list
      )
  end

  def valid?
    return false unless super

    clone_errors(@thought)

    @errors.empty?
  end
end
