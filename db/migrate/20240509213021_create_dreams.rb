# frozen_string_literal: true

# Create table for dreams
class CreateDreams < ActiveRecord::Migration[7.1]
  def change # rubocop:disable Metrics/MethodLength
    create_table :dreams, comment: 'Dreams' do |t|
      t.uuid :uuid, null: false, index: { unique: true }
      t.uuid :user_uuid, index: true, comment: 'Owner'
      t.references :sleep_place, foreign_key: { on_update: :cascade, on_delete: :nullify }
      t.integer :lucidity, limit: 2, null: false, default: 0
      t.integer :privacy, limit: 2, null: false, default: 0
      t.timestamps
      t.datetime :deleted_at
      t.inet :ip
      t.string :title
      t.text :body, null: false
    end

    add_index :dreams, "date_trunc('month', created_at)", name: 'dreams_created_month_idx'
  end
end
