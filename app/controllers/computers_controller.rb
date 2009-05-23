class ComputersController < ResourceController::Base
  create.wants.html { redirect_to computers_path }
end