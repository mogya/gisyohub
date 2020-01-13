FactoryBot.define do
  factory :job_log do
    type { "" }
    variable_json { "MyText" }
    started_at { "2020-01-09 05:30:09" }
    finished_at { "2020-01-09 05:30:09" }
    log { "MyText" }
  end
end
