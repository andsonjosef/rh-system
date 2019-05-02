class AdminsBackoffice::JobsController < AdminsBackofficeController
  def index
    @jobs = Job.all
  end

  def edit 
    @job = Job.find(params[:id])
  end

  def update 
    job = Job.find(params[:id])
    params_job = params.require(:job).permit(:title, :description, :local, :salary, :employment_type, :status)
    if job.update(params_job)
      redirect_to admins_backoffice_jobs_path, notice: "Vaga atualizada"
    else
      render :edit
    end
  end
end
