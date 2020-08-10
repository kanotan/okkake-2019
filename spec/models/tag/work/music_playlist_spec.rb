# == Schema Information
#
# Table name: tag_music_playlists
#
#  id                     :bigint           not null, primary key
#  abstract               :text
#  aggregate_rating_count :float
#  content_rating         :string
#  copyright_holder       :string
#  copyright_year         :integer
#  old_slug               :string
#  review_score           :float
#  reviews_count          :integer          default(0), not null
#  slug                   :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  tag_work_id            :bigint
#
# Indexes
#
#  index_tag_music_playlists_on_old_slug     (old_slug) UNIQUE
#  index_tag_music_playlists_on_slug         (slug) UNIQUE
#  index_tag_music_playlists_on_tag_work_id  (tag_work_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_work_id => tag_works.id)
#
require 'rails_helper'

RSpec.describe Tag::Work::MusicPlaylist, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:work) }
  end

  describe 'Attributes' do
    describe '#slug' do
      it { is_expected.to validate_presence_of(:slug) }

      it do
        create(:music_playlist, slug: 'A')
        expect(subject).to validate_uniqueness_of(:slug).case_insensitive
      end
    end

    describe '#old_slug' do
      it do
        create(:music_playlist, old_slug: 'A')
        expect(subject).to validate_uniqueness_of(:old_slug).case_insensitive
      end
    end

    describe '#reviews_count' do
      it { is_expected.to validate_presence_of(:reviews_count) }
    end
  end
end
