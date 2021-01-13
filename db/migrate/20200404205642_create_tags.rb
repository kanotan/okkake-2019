class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :name_kana
      t.string :name_en

      t.timestamps
    end
  end
end
