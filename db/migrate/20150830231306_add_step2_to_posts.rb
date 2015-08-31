class AddStep2ToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :step2, :text
  end
end
