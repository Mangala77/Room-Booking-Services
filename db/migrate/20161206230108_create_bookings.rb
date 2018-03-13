class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|    	
      t.belongs_to :room, index: true
      t.date :start#, null: false
      t.date :end#, null: false
      t.timestamps 
    end
  end
end
