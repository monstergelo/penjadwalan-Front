class CreateTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :tokens do |t|
      t.string :owner_id
      t.text :token_json

      t.timestamps
    end
  end
end
