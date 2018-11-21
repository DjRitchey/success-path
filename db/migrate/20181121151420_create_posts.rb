class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.string :title
      t.string :subtitle
      t.string :content
      t.binary :data
      t.string :filename
      t.string :mime_type

      t.timestamps null: false
    end
  end
end
