class ComputersController < ResourceController::Base
  create.wants.html { redirect_to :action => 'index' }
end
