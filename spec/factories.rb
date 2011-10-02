Factory.define :user do |f|
  f.sequence(:name) { |n| "user#{n}" }
  f.sequence(:email) { |n| "user#{n}@example.com" }
  f.password "secret"
end

Factory.define :questionnaire do |f|
  f.sequence(:name) {|n| "questionnaire#{n}"}
  f.association :user
end
