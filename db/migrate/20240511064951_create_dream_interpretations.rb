# frozen_string_literal: true

# Create table for DreamInterpretation model
class CreateDreamInterpretations < ActiveRecord::Migration[7.1]
  def change
    create_table :dream_interpretations, comment: 'Dream interpretations' do |t|
      t.uuid :uuid, null: false, index: { unique: true }
      t.references :dream, null: false, foreign_key: { on_update: :cascade, on_delete: :cascade }
      t.uuid :user_uuid, index: true
      t.text :body, null: false
      t.timestamps
    end
  end
end
