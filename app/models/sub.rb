class Sub < ApplicationRecord

  validates :title, :description, :moderator_id, presence: true

  belongs_to :user,
  foreign_key: :moderator_id,
  class_name: :User

  has_many :posts,
  foreign_key: :sub_id,
  class_name: :Sub

end
