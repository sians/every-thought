class Collections::UpdateService < BaseService
  attr_accessor :name

  attr_accessor :collection

  validates :name, presence: true

  def call_after_validation
    update_collection

    valid?
  end

  def update_collection
    @collection.update(name: @name)
  end

  def valid?
    return false unless super

    clone_errors(@collection)

    @errors.empty?
  end
end
