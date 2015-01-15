FactoryGirl.define do
  factory :job do
    sequence(:guid) { |n| "https://example.com/job#{n}" }
    sequence(:title) { |n| "Job #{n}" }
    url { guid }
    summary { "Summary for #{title}" }
    published_at { Time.now }
  end
end
