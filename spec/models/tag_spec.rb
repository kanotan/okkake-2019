# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  name_en    :string
#  name_kana  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tags_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'Attributes' do
    describe '#name' do
      it { is_expected.to validate_presence_of(:name) }

      it do
        create(:tag, name: 'A')
        expect(subject).to validate_uniqueness_of(:name).case_insensitive
      end
    end
  end
end
