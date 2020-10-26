class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.string :account, default: "", null: false
      t.timestamps
    end

    add_index :profiles, :account, unique: true
  end
end
