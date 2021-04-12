FactoryBot.define do
  factory :item do
    item_name            {'写真'}
    item_info            {'素晴らしい'}
    category_id            {3}
    sales_status_id        {2}
    delivery_fee_id        {1}
    prefecture_id          {5}
    delivery_date_id       {1}
    price                {50000}
    association :user 
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
   end
  end
 end
 

