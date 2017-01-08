class PopulateComments < ActiveRecord::Migration
  def change
    add_column :comments, :commenter, :string
    add_column :comments, :body, :text
    add_column :comments, :datetime, :created_at
    add_column :comments, :article_id, :integer
  end
end
