class ListSerializer < BaseSerializer
  attribute :name

  has_many :thoughts
end
