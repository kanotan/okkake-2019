# == Schema Information
#
# Table name: tag_anime_series
#
#  id          :bigint           not null, primary key
#  old_slug    :string
#  slug        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tag_work_id :bigint           not null
#
# Indexes
#
#  index_tag_anime_series_on_old_slug     (old_slug) UNIQUE
#  index_tag_anime_series_on_slug         (slug) UNIQUE
#  index_tag_anime_series_on_tag_work_id  (tag_work_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_work_id => tag_works.id)
#
require 'rails_helper'

RSpec.describe Tag::Work::AnimeSeries, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:work) }
    it { is_expected.to have_many(:anime_seasons) }
  end

  describe 'Attributes' do
    describe '#slug' do
      it { is_expected.to validate_presence_of(:slug) }

      it do
        create(:anime_series, slug: 'A')
        expect(subject).to validate_uniqueness_of(:slug).case_insensitive
      end
    end

    describe '#old_slug' do
      it do
        create(:anime_series, old_slug: 'A')
        expect(subject).to validate_uniqueness_of(:old_slug).case_insensitive
      end
    end
  end
end
