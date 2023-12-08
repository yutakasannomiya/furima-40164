FactoryBot.define do
  factory :item do
    item_name            {'時計'}
    item_text            {'日本製'}
    category_id          {2}
    condition_id         {2}
    shipping_id          {2}
    pref_id              {2}
    scheduled_day_id     {2}
    item_price           {1000}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
