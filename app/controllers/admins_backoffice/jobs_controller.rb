class AdminsBackoffice::JobsController < AdminsBackofficeController
  def index
    @jobs = Job.all
  end
end
