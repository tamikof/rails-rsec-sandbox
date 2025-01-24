class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.jsonb :tag
      t.string :status, default: "draft"
      t.boolean :is_admin, default: false, null: false

      t.timestamps
    end
  end
end
