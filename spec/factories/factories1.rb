FactoryGirl.define do

  #category factory witout associated prizes
  factory :category do
    sequence :name do |n|
      "Category #{n}"
    end

    factory :category_with_prizes do
      ignore do
        prize_count 2
      end
      after(:create) do |category, evaluator|
        FactoryGirl.create_list(:prize, evaluator.prize_count, category: category)
      end
    end
  end

  factory :prize do
    sequence :title do |n| 
      "Prize #{n}" 
    end
    sequence :description do |n|
      "#{100 + n} p-description"
    end
    category
  end
end
