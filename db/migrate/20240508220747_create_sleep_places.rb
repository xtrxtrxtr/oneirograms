# frozen_string_literal: true

# Create table for SleepPlace model
class CreateSleepPlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :sleep_places, comment: 'Places where dreams are seen' do |t|
      t.uuid :uuid, null: false, index: { unique: true }
      t.uuid :user_uuid, null: false, comment: 'Owner (UUID)'
      t.integer :dreams_count, default: 0, null: false, comment: 'Dream count for this place'
      t.string :name, null: false
      t.timestamps
    end

    add_index :sleep_places, %i[user_uuid name], unique: true
  end
end
