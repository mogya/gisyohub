FactoryBot.define do
  factory :assignment_log do
    worker { nil }
    tweet { nil }
    book { nil }
    event { nil }
    actionType { 1 }
    worker { nil }
    log { "MyText" }
  end
end
