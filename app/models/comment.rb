class Comment < ApplicationRecord
  belongs_to :article

  validates :commenter, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 2000 }
end
