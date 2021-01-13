# == Schema Information
#
# Table name: tag_anime_seasons
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
#  tag_anime_series_id    :bigint
#
# Indexes
#
#  index_tag_anime_seasons_on_old_slug             (old_slug) UNIQUE
#  index_tag_anime_seasons_on_slug                 (slug) UNIQUE
#  index_tag_anime_seasons_on_tag_anime_series_id  (tag_anime_series_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_anime_series_id => tag_anime_series.id)
#
FactoryBot.define do
  factory :anime_season, class: 'Tag::Work::AnimeSeason' do
    slug { Faker::Name.name }
    anime_series
  end
end
