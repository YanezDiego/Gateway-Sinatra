class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.datetime  :time_created
      t.integer :user_id
    end
  end
end
