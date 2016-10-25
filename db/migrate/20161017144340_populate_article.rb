class PopulateArticle < ActiveRecord::Migration
  def change
    add_column :articles, :title, :string
    add_column :articles, :text, :text
    add_column :articles, :datetime, :created_at

  end
end
