class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_categories
  has_many :categories, :through => :post_categories

  acts_as_paranoid

  accepts_nested_attributes_for :categories

  def category_attributes=(category_attributes)
    category_attributes.values.each do |cat|
      category = Category.find_or_create_by(tag: cat[:tag])
      self.categories << category
    end 
  end
end
