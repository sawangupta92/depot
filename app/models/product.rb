class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, through: :line_items
  has_many :ratings, dependent: :destroy

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  def as_json(options = {})
    { id: id, rating: average_rating }
  end

  def self.latest
    Product.order(:updated_at).last
  end

  def average_rating
    product = Product.includes(:ratings).where('id = ?', id).first
    product.ratings.average(:rating).to_i
  end

  def get_rating(user_id)
    ratings.find_by_user_id(user_id).try(:id)
  end

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end

end
