class CreateTagPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_people do |t|
      t.string :slug, null: false, index: { unique: true }
      t.string :old_slug, index: { unique: true }
      t.string :in_language

      t.string :family_name
      t.string :given_name
      t.string :additional_name
      t.string :gender
      t.string :blood_type
      t.integer :birth_year
      t.integer :birth_month
      t.integer :birth_date
      t.integer :death_year
      t.integer :death_month
      t.integer :death_date
      t.string :birth_place
      t.string :death_place
      t.float :height
      t.float :weight
      t.float :bust
      t.float :waist
      t.float :hip
      t.float :shoe_size

      t.integer :follows_count, default: 0, null: false
      t.integer :comments_count, default: 0, null: false
      t.integer :trivias_count, default: 0, null: false
      t.references :tag, foreign_key: true, null: false
      t.timestamps
    end
  end
end
