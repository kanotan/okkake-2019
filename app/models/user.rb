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

class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  devise :registerable, :rememberable, :trackable, :omniauthable

  validates :provider, presence: true
  validates :uid, presence: true
  validates :uid, uniqueness: { scope: :provider }
  validates :screen_name, presence: true, uniqueness: true
  validates :name, presence: true

  enum provider: { twitter: 1, google: 2, facebook: 3 }

  # devise_token_authで暗黙的に有効になってる部分を無視
  def confirmed_at
    created_at
  end

  # devise_token_authで暗黙的に有効になってる部分を無視
  def encrypted_password
  end
end
