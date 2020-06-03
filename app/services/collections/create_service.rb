class Collections::CreateService < BaseService
  attr_accessor :name
  attr_accessor :user

  attr_accessor :collection

  validates :name, presence: true
  validates :user, presence: true

  def call_after_validation
    create_collection

    valid?
  end

  def create_collection
    @collection = Collection.create(
      name: @name,
      user: @user
      )
  end

  def valid?
    return false unless super

    clone_errors(@collection)

    @errors.empty?
  end
end
