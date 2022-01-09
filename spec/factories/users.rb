# == Schema Information
#
# Table name: users
#
#  id                    :bigint           not null, primary key
#  bio                   :text
#  current_sign_in_at    :datetime
#  current_sign_in_ip    :string
#  last_sign_in_at       :datetime
#  last_sign_in_ip       :string
#  name                  :string
#  provider              :integer          not null
#  remember_created_at   :datetime
#  remember_token        :string
#  screen_name           :string
#  sign_in_count         :integer          default(0), not null
#  tokens                :text
#  twitter_access_secret :string
#  twitter_access_token  :string
#  uid                   :string           default(""), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_users_on_provider_and_uid  (provider,uid) UNIQUE
#  index_users_on_screen_name       (screen_name) UNIQUE
#

FactoryBot.define do
  factory :user do
    provider { 'twitter' }
    uid { Faker::Number.number(12) }
    screen_name { Faker::Alphanumeric.alphanumeric(number: 10) }
    name { Faker::Name.name }
  end
end
