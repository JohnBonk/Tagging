class AddStep1ToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :step, :text
  end
end
