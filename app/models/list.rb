class List < ApplicationRecord
  has_many :thoughts

  belongs_to :user
  belongs_to :collection, optional: true
end
