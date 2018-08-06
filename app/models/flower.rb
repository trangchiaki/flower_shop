class Flower < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader
  validates :name, presence: true, uniqueness: true
  validates :image, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 1.0}
  validates :image, format: {with: /\.(gif|jpg|png|jpeg)\Z/i,
                             message: "Chi nhan file GIF, JPG, PNG, JPEG"}
end
