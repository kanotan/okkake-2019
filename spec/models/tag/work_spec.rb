# == Schema Information
#
# Table name: tag_works
#
#  id             :bigint           not null, primary key
#  comments_count :integer          default(0), not null
#  follows_count  :integer          default(0), not null
#  in_language    :string
#  old_slug       :string
#  slug           :string           not null
#  trivias_count  :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  tag_id         :bigint           not null
#
# Indexes
#
#  index_tag_works_on_old_slug  (old_slug) UNIQUE
#  index_tag_works_on_slug      (slug) UNIQUE
#  index_tag_works_on_tag_id    (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_id => tags.id)
#
require 'rails_helper'

RSpec.describe Tag::Work, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:tag) }
  end

  describe 'Attributes' do
    describe '#slug' do
      it { is_expected.to validate_presence_of(:slug) }

      it do
        create(:work, slug: 'A')
        expect(subject).to validate_uniqueness_of(:slug).case_insensitive
      end
    end

    describe '#old_slug' do
      it do
        create(:work, old_slug: 'A')
        expect(subject).to validate_uniqueness_of(:old_slug).case_insensitive
      end
    end

    describe '#follows_count' do
      it { is_expected.to validate_presence_of(:follows_count) }
    end

    describe '#comments_count' do
      it { is_expected.to validate_presence_of(:comments_count) }
    end

    describe '#trivias_count' do
      it { is_expected.to validate_presence_of(:trivias_count) }
    end
  end
end
