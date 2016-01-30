class AddUserIdToAticles < ActiveRecord::Migration
  def change
    add_column :aticles, :user_id, :integer
  end
end
