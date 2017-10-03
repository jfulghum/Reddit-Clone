class Post < ApplicationRecord

  validates :title, :url, :content, :sub_id, :author_id, presence: true

  has_one :sub,
  foreign_key: :sub_id,
  class_name: :Sub
end
