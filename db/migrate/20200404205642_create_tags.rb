class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :slug, null: false, unique: true
      t.string :name, null: false
      t.string :name_kana
      t.text :alternate_name
      t.text :description
      t.text :disambiguating_description
      t.string :url
      t.text :image_data

      t.timestamps
    end
  end
end
