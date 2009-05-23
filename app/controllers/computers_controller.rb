class ComputersController < ApplicationController
  def new
    @computer = Computer.new
    respond_to(:html) # new.html.haml
  end
end
