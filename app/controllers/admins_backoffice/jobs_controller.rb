class AdminsBackoffice::JobsController < AdminsBackofficeController
  before_action :set_job, only: [:edit, :update]
  
  def index
    @jobs = Job.all
  end

  def edit 

  end

  def update 
    if @job.update(params_job)
      redirect_to admins_backoffice_jobs_path, notice: "Vaga atualizada"
    else
      render :edit
    end
  end

  private
  def params_job
    params.require(:job).permit(:title, :description, :local, :salary, :employment_type, :status)
  end

   def set_job
    @job = Job.find(params[:id])
  end
end
