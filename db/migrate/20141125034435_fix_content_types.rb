class FixContentTypes < ActiveRecord::Migration
  def up
    change_column :articles, :content, :text, limit: nil
    change_column :pages, :content, :text, limit: nil
  end

  def down
    change_column :articles, :content, :string, limit: 255
    change_column :pages, :content, :string, limit: 255
  end
end
