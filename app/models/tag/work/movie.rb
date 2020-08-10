# == Schema Information
#
# Table name: tag_movies
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
#  tag_movie_series_id    :bigint
#
# Indexes
#
#  index_tag_movies_on_old_slug             (old_slug) UNIQUE
#  index_tag_movies_on_slug                 (slug) UNIQUE
#  index_tag_movies_on_tag_movie_series_id  (tag_movie_series_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_movie_series_id => tag_movie_series.id)
#

class Tag
  class Work
    class Movie < ApplicationRecord
      self.table_name = 'tag_movies'

      # Work Relations
      belongs_to :movie_series, required: true, class_name: Tag::Work::MovieSeries.name,
                                foreign_key: :tag_movie_series_id

      validates :slug, presence: true, uniqueness: { case_sensitive: false }
      validates :old_slug, uniqueness: { case_sensitive: false }, allow_blank: true
      validates :reviews_count, presence: true
    end
  end
end
