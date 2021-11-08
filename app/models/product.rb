class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :prefecture 
  belongs_to :shipping_cost 
  belongs_to :shipping_days 
  belongs_to :status 
  has_one_attached :image 
  
  validates :price, presence: true, numericality:{ only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to:9_999_999 }
  validates :description, presence: true        
  validates :status_id, presence: true       
  validates :shipping_cost_id, presence: true   
  validates :shipping_days_id, presence: true    
  validates :prefecture_id, presence: true      
  validates :category_id, presence: true        
  validates :user, presence: true
  validates :image, presence: true  
  validates :product_name, presence: true
  


  validates :category_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 0 } 
  validates :shipping_cost_id, numericality: { other_than: 1 } 
  validates :shipping_days_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
end

