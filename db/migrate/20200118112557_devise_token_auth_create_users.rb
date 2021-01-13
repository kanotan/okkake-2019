class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      ## User Info
      t.string :name
      t.text :bio

      ## Rememberable
      t.datetime :remember_created_at
      t.string :remember_token

      ## trackable
      t.integer :sign_in_count, null: false, default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      ## Omniauth
      t.integer :provider, null: false
      t.string :uid, null: false, default: ''
      t.string :screen_name

      ## Twitter
      t.string :twitter_access_token
      t.string :twitter_access_secret

      ## Tokens
      t.text :tokens

      t.timestamps
    end

    add_index :users, %i[provider uid], unique: true
    add_index :users, :screen_name, unique: true
  end
end
