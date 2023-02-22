class Like < ApplicationRecord
  belongs_to :post
  delegate :author, to: :post
end
