class Lists::UpdateService < BaseService
  attr_accessor :name
  attr_accessor :collection_id
  attr_accessor :user

  attr_accessor :list

  validates :list, presence: true

  def call_after_validation
    update_list

    valid?
  end

  def update_list
    if @collection_id.present?
      @collection = Collection.where(user: @user).find(@collection_id)
    end

    @list.collection = @collection || nil
    @list.name = @name
    @list.save
  end

  def valid?
    return false unless super

    clone_errors(@list)

    @errors.empty?
  end
end
