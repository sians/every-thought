class Lists::CreateService < BaseService
  attr_accessor :name
  attr_accessor :user
  attr_accessor :collection_id

  attr_accessor :list

  validates :name, presence: true
  validates :user, presence: true

  def call_after_validation
    create_list

    valid?
  end

  def create_list
    if @collection_id.present?
      @collection = Collection.where(user: @user).find(@collection_id)
    end

    @list = List.create(
      name: @name,
      user: @user,
      collection: @collection || nil
      )
  end

  def valid?
    return false unless super

    clone_errors(@list)

    @errors.empty?
  end
end
