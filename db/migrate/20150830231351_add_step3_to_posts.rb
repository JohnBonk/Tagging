class AddStep3ToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :step3, :text
  end
end
