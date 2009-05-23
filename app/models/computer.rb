# == Schema Information
# Schema version: 20090512102220
#
# Table name: computers
#
#  id               :integer(4)      not null, primary key
#  color            :string(255)
#  processor        :string(255)
#  operating_system :string(255)
#  office_software  :string(255)
#  warranty         :string(255)
#  ram_memory       :string(255)
#  hard_drive       :string(255)
#  monitors         :string(255)
#  timestamps       :string(255)
#

class Computer < ActiveRecord::Base
  def self.configuration_options_data
    @options_hash ||= YAML::load_file(Rails.root.join('config/options.yml'))
  end
  
  def self.section_types
    self.configuration_options_data.keys.sort
  end
  
 
  class << self
    Computer.section_types.each do |column_name|
      define_method "#{column_name}_options" do
        options_array_for(column_name)
      end
    end
  end

  protected

    def self.options_array_for(name)
      self.configuration_options_data[name]
    end
end
