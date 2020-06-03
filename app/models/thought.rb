class Thought < ApplicationRecord
  belongs_to :list
  belongs_to :user

  enum status: {"incomplete": 0, "complete": 1, "abandoned": 2}
end
