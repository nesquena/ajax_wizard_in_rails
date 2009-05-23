# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090512102220) do

  create_table "computers", :force => true do |t|
    t.string  "color"
    t.string  "processor"
    t.string  "operating_system"
    t.string  "office_software"
    t.string  "warranty"
    t.string  "ram_memory"
    t.string  "hard_drive"
    t.string  "monitors"
    t.integer "price"
    t.string  "timestamps"
  end

end
