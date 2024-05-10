# frozen_string_literal: true

# Create table for PersonalPattern model
class CreatePersonalPatterns < ActiveRecord::Migration[7.1]
  def change
    create_table :personal_patterns, comment: 'Personal dream patterns' do |t|
      t.uuid :uuid, null: false, index: { unique: true }
      t.uuid :user_uuid, null: false, comment: 'Owner (UUID)'
      t.string :name, null: false
      t.timestamps
    end

    add_index :personal_patterns, %i[user_uuid name], unique: true
  end
end
