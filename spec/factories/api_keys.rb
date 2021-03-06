FactoryGirl.define do
  factory :api_key_apis, class: Carto::ApiKey do
    initialize_with { Carto::ApiKey.send :new }

    type Carto::ApiKey::TYPE_REGULAR
    name { unique_name('regular api key for apis') }
    grants [{ type: "apis",
              apis: ["sql", "maps"] }]
  end

  factory :master_api_key, class: Carto::ApiKey do
    initialize_with { Carto::ApiKey.send :new }

    type Carto::ApiKey::TYPE_MASTER
    name Carto::ApiKey::NAME_MASTER
    grants [{ type: "apis",
              apis: ["sql", "maps"] }]
  end

  factory :oauth_api_key, class: Carto::ApiKey do
    initialize_with { Carto::ApiKey.send :new }

    type Carto::ApiKey::TYPE_OAUTH
    name { unique_name('internal api key') }
    grants [{ type: "apis", apis: [] }]
  end
end
