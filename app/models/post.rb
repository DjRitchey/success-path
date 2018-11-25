class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_categories
  has_many :categories, :through => :post_categories
  has_attached_file :image
  validates_attachment_content_type :image,
  :content_type => /\Aimage\/.*\Z/
  acts_as_paranoid

  accepts_nested_attributes_for :categories

  def category_attributes=(category_attributes)
    category_attributes.values.each do |cat|
      category = Category.find_or_create_by(tag: cat[:tag])
      self.categories << category
    end
  end
end
