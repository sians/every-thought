class CollectionSerializer < BaseSerializer
  attribute :name

  has_many :lists
end
