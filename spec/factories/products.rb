FactoryBot.define do
  factory :product do
    price            {12345}
    description      {'漢字ひらがなカタカナabc123'} 
    product_name     {'漢字ひらがなカタカナabc123'} 
    category_id      {2}
    status_id        {2} 
    shipping_cost_id {2}
    shipping_days_id {2}
    prefecture_id    {2}
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
