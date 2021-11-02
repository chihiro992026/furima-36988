 FactoryBot.define do
    factory :user do
      nickname              {'test'}
      email                 {'test@example'}
      password              {'123acb'}
      password_confirmation {password}
      family_name           {'漢字ひらがなカタカナ'}
      first_name            {'漢字ひらがなカタカナ'}
      family_name_kana      {'カタカナ'}
      first_name_kana       {'カタカナ'}
      birthday              {'1981-02-20'}   
    end
end
