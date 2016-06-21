class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :body
      t.string :image_id
      t.string :image_filename

      t.timestamps null: false
    end
  end
end
