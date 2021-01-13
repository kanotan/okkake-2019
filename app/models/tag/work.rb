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

class Tag
  class Work < ApplicationRecord
    self.table_name = 'tag_works'

    belongs_to :tag, required: true

    # Work Relations
    has_many :anime_series, dependent: :destroy, class_name: Tag::Work::AnimeSeries.name,
                            foreign_key: :tag_work_id
    has_many :book_series, dependent: :destroy, class_name: Tag::Work::BookSeries.name,
                           foreign_key: :tag_work_id
    has_many :comic_stories, dependent: :destroy, class_name: Tag::Work::ComicStory.name,
                             foreign_key: :tag_work_id
    has_many :movie_series, dependent: :destroy, class_name: Tag::Work::MovieSeries.name,
                            foreign_key: :tag_work_id
    has_many :music_playlists, dependent: :destroy, class_name: Tag::Work::MusicPlaylist.name,
                               foreign_key: :tag_work_id
    has_many :music_recordings, dependent: :destroy, class_name: Tag::Work::MusicRecording.name,
                                foreign_key: :tag_work_id
    has_many :radio_drama_series, dependent: :destroy, class_name: Tag::Work::RadioDramaSeries.name,
                                  foreign_key: :tag_work_id
    has_many :radio_series, dependent: :destroy, class_name: Tag::Work::RadioSeries.name,
                            foreign_key: :tag_work_id
    has_many :streaming_series, dependent: :destroy, class_name: Tag::Work::StreamingSeries.name,
                                foreign_key: :tag_work_id
    has_many :tv_drama_series, dependent: :destroy, class_name: Tag::Work::TvDramaSeries.name,
                               foreign_key: :tag_work_id
    has_many :tv_series, dependent: :destroy, class_name: Tag::Work::TvSeries.name,
                         foreign_key: :tag_work_id
    has_many :video_game_series, dependent: :destroy, class_name: Tag::Work::VideoGameSeries.name,
                                 foreign_key: :tag_work_id

    validates :slug, presence: true, uniqueness: { case_sensitive: false }
    validates :old_slug, uniqueness: { case_sensitive: false }, allow_blank: true
    validates :follows_count, presence: true
    validates :comments_count, presence: true
    validates :trivias_count, presence: true
  end
end
