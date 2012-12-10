class CreateVotes < ActiveRecord::Migration
  def change
   
   create_table :votes do |t|

      t.references :user	
      t.references :video
      end
      
      add_index :votes, ['user_id','video_id']
   end
end
