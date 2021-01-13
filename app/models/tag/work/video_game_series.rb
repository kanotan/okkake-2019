# == Schema Information
#
# Table name: tag_video_game_series
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
#  index_tag_video_game_series_on_old_slug     (old_slug) UNIQUE
#  index_tag_video_game_series_on_slug         (slug) UNIQUE
#  index_tag_video_game_series_on_tag_work_id  (tag_work_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_work_id => tag_works.id)
#

class Tag
  class Work
    class VideoGameSeries < ApplicationRecord
      self.table_name = 'tag_video_game_series'

      # Work Relations
      belongs_to :work, required: true, class_name: Tag::Work.name, foreign_key: :tag_work_id
      has_many :video_games, dependent: :destroy, class_name: Tag::Work::VideoGame.name,
                             foreign_key: :tag_video_game_series_id

      validates :slug, presence: true, uniqueness: { case_sensitive: false }
      validates :old_slug, uniqueness: { case_sensitive: false }, allow_blank: true
    end
  end
end
