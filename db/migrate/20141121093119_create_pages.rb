class CreatePages < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :slug
      t.integer :category_id
    end

    add_index :categories, :slug, unique: true

    create_table :pages do |t|
      t.string :title
      t.string :content
      t.boolean :published
      t.datetime :published_at
      t.string :slug
    end

    add_index :pages, :slug, unique: true
  end
end
