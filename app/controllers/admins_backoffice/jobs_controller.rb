class AdminsBackoffice::JobsController < AdminsBackofficeController
  before_action :set_job, only: [:edit, :update, :destroy]
  
  def index
    @jobs = Job.all.page(params[:page]).per(10)
  end

  def new 
    @job = Job.new
  end

  def create
    @job = Job.new(params_job)
    if @job.save
      redirect_to admins_backoffice_jobs_path, notice: "Vaga Cadastrada com sucesso!"
    else
      render :new
    end
  end

  def destroy
    if @job.destroy
    redirect_to admins_backoffice_jobs_path, notice: "Vaga excluída com sucesso!"
    else
    render :index
    end
  end

  def edit 
  end

  def update 
    if @job.update(params_job)
      redirect_to admins_backoffice_jobs_path, notice: "Vaga atualizada com sucesso!"
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
