class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.boolean :won?, default: false
      t.integer :user_id
      t.datetime :end_time
      t.timestamps
    end
  end
end
