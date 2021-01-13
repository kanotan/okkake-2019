# == Schema Information
#
# Table name: tag_radio_seasons
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
#  tag_radio_series_id    :bigint
#
# Indexes
#
#  index_tag_radio_seasons_on_old_slug             (old_slug) UNIQUE
#  index_tag_radio_seasons_on_slug                 (slug) UNIQUE
#  index_tag_radio_seasons_on_tag_radio_series_id  (tag_radio_series_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_radio_series_id => tag_radio_series.id)
#

class Tag
  class Work
    class RadioSeason < ApplicationRecord
      self.table_name = 'tag_radio_seasons'

      # Work Relations
      belongs_to :radio_series, required: true, class_name: Tag::Work::RadioSeries.name,
                                foreign_key: :tag_radio_series_id

      validates :slug, presence: true, uniqueness: { case_sensitive: false }
      validates :old_slug, uniqueness: { case_sensitive: false }, allow_blank: true
      validates :reviews_count, presence: true
    end
  end
end
