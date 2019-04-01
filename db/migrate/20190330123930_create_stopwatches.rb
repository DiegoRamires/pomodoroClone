class CreateStopwatches < ActiveRecord::Migration[5.1]
  def change
    create_table :stopwatches do |t|
      t.integer :work_cyle
      t.integer :fast_pause
      t.integer :long_pause
      t.boolean :has_sound_on_terminate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
