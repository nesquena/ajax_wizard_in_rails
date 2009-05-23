class CreateComputers < ActiveRecord::Migration
  def self.up
    create_table :computers do |t|
      t.string :color
      t.string :processor
      t.string :operating_system
      t.string :office_software
      t.string :warranty
      t.string :ram_memory
      t.string :hard_drive
      t.string :monitors
      t.string :timestamps
    end
  end

  def self.down
    drop_table :computers
  end
end
