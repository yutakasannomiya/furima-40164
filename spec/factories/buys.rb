FactoryBot.define do
  factory :buy do
    token                 {"tok_abcdefghijk00000000000000000"}
    post_code             {'000-0000'}
    pref_id               {2}
    city                  {'横浜市緑区'}
    address               {'青山３丁目2-2'}
    building              {'伊藤ビル404'}
    tel                   {'09012341234'}
  end
end
