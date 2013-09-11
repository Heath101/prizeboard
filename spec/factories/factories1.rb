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
        FactoryGirl.create_list(:prize_with_elements, evaluator.prize_count, category: category)
      end
    end
  end

  factory :prize_element do
    sequence :name do |n| 
      "Prize Element #{n}" 
    end
    sequence :value do |v| 
      100 + v
    end
    prize
  end


  factory :prize do
    active true
    category

    # prize_with_elements will create element data after the post has been created
    factory :prize_with_elements do
      # posts_count is declared as an ignored attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      ignore do
        element_count 3
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including ignored
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |prize, evaluator|
        FactoryGirl.create_list(:prize_element, evaluator.element_count, prize: prize)
      end
    end
  end
end
