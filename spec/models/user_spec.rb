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

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Attributes' do
    describe '#provider' do
      it { is_expected.to validate_presence_of(:provider) }
    end

    describe '#uid' do
      it { is_expected.to validate_presence_of(:uid) }

      it do
        create(:user)
        expect(subject).to validate_uniqueness_of(:uid).scoped_to(:provider).case_insensitive
      end
    end

    describe '#screen_name' do
      it { is_expected.to validate_presence_of(:screen_name) }
    end

    describe '#name' do
      it { is_expected.to validate_presence_of(:name) }
    end
  end
end
