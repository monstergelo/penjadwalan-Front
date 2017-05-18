class CreateDosens < ActiveRecord::Migration[5.0]
  def change
    create_table :dosens do |t|
      t.string :NIP
      t.string :nama
      t.string :email

      t.timestamps
    end
  end
end
