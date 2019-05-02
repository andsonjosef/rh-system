class AdminsBackoffice::JobsController < AdminsBackofficeController
  def index
    @jobs = Job.all
  end

  def edit 
    @job = Job.find(params[:id])
  end
end
