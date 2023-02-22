class Comment < ApplicationRecord
  belongs_to :post
  delegate :user, to: :post
end
