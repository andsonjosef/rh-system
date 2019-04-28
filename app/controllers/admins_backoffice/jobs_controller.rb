class AdminsBackoffice::JobsController < AdminsBackofficeController
  def index
    @jobs = Jobs.all
  end
end
