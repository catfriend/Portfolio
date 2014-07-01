class CreateCarrierwaveImages < ActiveRecord::Migration
  def change
    create_table :carrierwave_images do |t|

      t.timestamps
    end
  end
end
