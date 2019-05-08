FactoryGirl.define do
  factory :mno_enterprise_main_address, :class => 'Address' do
    factory :main_address, class: MnoEnterprise::Address do
      sequence(:id, &:to_s)
      street '404 5th Ave'
      city 'New York'
      state_code 'NY'
      postal_code '10018'
      country_code 'US'
      main true
      owner nil
      phone '9174550598'
      phone_country_code '1'
    end
  end
end