class Like < ApplicationRecord
  belongs_to :post
  delegate :user, to: :post
end
