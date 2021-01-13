class CreateWorkChildren < ActiveRecord::Migration[6.0]
  def change
    # CreativeWorkLists
    lists = %i[
      tag_anime_series tag_tv_drama_series tag_tv_series tag_streaming_series
      tag_movie_series tag_radio_series tag_radio_drama_series tag_video_game_series
    ]

    lists.each do |list|
      create_table list do |t|
        t.string :slug, null: false, index: { unique: true }
        t.string :old_slug, index: { unique: true }
        t.references :tag_work, foreign_key: true, null: false
        t.timestamps
      end
    end

    # CreativeWorkEntities
    entities = %i[
      tag_anime_seasons tag_tv_drama_seasons tag_tv_seasons tag_streaming_seasons
      tag_radio_seasons tag_radio_drama_seasons tag_movies tag_video_games
      tag_comic_stories tag_book_series tag_music_playlists tag_music_recordings
    ]

    entities.each do |entity|
      create_table entity do |t|
        t.string :slug, null: false, index: { unique: true }
        t.string :old_slug, index: { unique: true }
        t.text :abstract
        t.integer :reviews_count, null: false, default: 0
        t.float :aggregate_rating_count
        t.float :review_score
        t.string :content_rating
        t.string :copyright_holder
        t.integer :copyright_year
        t.timestamps
      end
    end

    add_reference :tag_anime_seasons, :tag_anime_series, foreign_key: true
    add_reference :tag_tv_drama_seasons, :tag_tv_drama_series, foreign_key: true
    add_reference :tag_tv_seasons, :tag_tv_series, foreign_key: true
    add_reference :tag_streaming_seasons, :tag_streaming_series, foreign_key: true
    add_reference :tag_radio_seasons, :tag_radio_series, foreign_key: true
    add_reference :tag_radio_drama_seasons, :tag_radio_drama_series, foreign_key: true
    add_reference :tag_movies, :tag_movie_series, foreign_key: true
    add_reference :tag_video_games, :tag_video_game_series, foreign_key: true
    add_reference :tag_comic_stories, :tag_work, foreign_key: true
    add_reference :tag_book_series, :tag_work, foreign_key: true
    add_reference :tag_music_playlists, :tag_work, foreign_key: true
    add_reference :tag_music_recordings, :tag_work, foreign_key: true
  end
end
