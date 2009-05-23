class ComputersController < ApplicationController
  def index
    @computers = Computer.all
    respond_to(:html) # index.html.haml
  end

  def new
    @computer = Computer.new
    respond_to(:html) # new.html.haml
  end

  def create
    @computer = Computer.new(params[:computer])
    respond_to do |wants|
      if @computer.save
        wants.html { redirect_to :action => 'index'  }
      else
        wants.html { render :action => 'new'  }
      end
    end
  end
  
  def destroy
    @computer = Computer.find(params[:id])
    @computer.destroy
    respond_to do |wants|
      wants.html { redirect_to :action => 'index' }
    end
  end
end
