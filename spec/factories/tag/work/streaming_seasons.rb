# == Schema Information
#
# Table name: tag_streaming_seasons
#
#  id                      :bigint           not null, primary key
#  abstract                :text
#  aggregate_rating_count  :float
#  content_rating          :string
#  copyright_holder        :string
#  copyright_year          :integer
#  old_slug                :string
#  review_score            :float
#  reviews_count           :integer          default(0), not null
#  slug                    :string           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  tag_streaming_series_id :bigint
#
# Indexes
#
#  index_tag_streaming_seasons_on_old_slug                 (old_slug) UNIQUE
#  index_tag_streaming_seasons_on_slug                     (slug) UNIQUE
#  index_tag_streaming_seasons_on_tag_streaming_series_id  (tag_streaming_series_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_streaming_series_id => tag_streaming_series.id)
#
FactoryBot.define do
  factory :streaming_season, class: 'Tag::Work::StreamingSeason' do
    slug { Faker::Name.name }
    streaming_series
  end
end
