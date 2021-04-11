class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_date
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :category
 


  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 0 } do
   validates :category_id
   validates :sales_status_id
   validates :prefecture_id
   validates :delivery_date_id
   validates :delivery_fee_id
  end
   with_options presence:true do
   validates :item_name
   validates :item_info
   validates :image
   validates :price
   end
   #numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999,message: 'Out of setting range' }
   validates :price, numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999,message:' Out of setting range'}
end


