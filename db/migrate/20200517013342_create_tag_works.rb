class CreateTagWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_works do |t|
      t.string :slug, null: false, index: { unique: true }
      t.string :old_slug, index: { unique: true }
      t.string :in_language
      t.integer :follows_count, default: 0, null: false
      t.integer :comments_count, default: 0, null: false
      t.integer :trivias_count, default: 0, null: false
      t.references :tag, foreign_key: true, null: false
      t.timestamps
    end
  end
end
