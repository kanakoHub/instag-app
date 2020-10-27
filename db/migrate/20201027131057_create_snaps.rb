class CreateSnaps < ActiveRecord::Migration[6.0]
  def change
    create_table :snaps do |t|
      t.references :user, null: false
      t.timestamps
    end
  end
end
