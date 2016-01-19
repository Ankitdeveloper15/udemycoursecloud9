class CreateAticles < ActiveRecord::Migration
  def change
    create_table :aticles do |t|
      t.string :title
      
    end
  end
end
