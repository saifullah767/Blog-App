class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :Author, null: false, foreign_key: { to_table: :users }
      t.references :Post, null: false, foreign_key: { to_table: :posts }

      t.timestamps
    end
  end
end
