# == Schema Information
#
# Table name: tag_music_recordings
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
#  index_tag_music_recordings_on_old_slug     (old_slug) UNIQUE
#  index_tag_music_recordings_on_slug         (slug) UNIQUE
#  index_tag_music_recordings_on_tag_work_id  (tag_work_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_work_id => tag_works.id)
#
FactoryBot.define do
  factory :music_recording, class: 'Tag::Work::MusicRecording' do
    slug { Faker::Name.name }
    work
  end
end
