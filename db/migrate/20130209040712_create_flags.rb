class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.references :user	
      t.references :video
      t.timestamps

       
    end
     add_index :flags, ['user_id','video_id']
  end
end
