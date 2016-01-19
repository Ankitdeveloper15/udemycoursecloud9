class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    
    add_column :aticles, :description, :text
    add_column :aticles, :created_at, :datetime
    add_column :aticles, :updated_at, :datetime
  end
end
