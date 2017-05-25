class CreateUsers < ActiveRecord::Migration[5.0]
  def self.up
    drop_table :users
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :name
      t.string :oauth_token
      t.string :oauth_refresh_token
      t.string :role
      t.string :NIP
      t.string :NIM
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
