class JobsController < ApplicationController

  def sorted_jobs
    if params[:sort] == "location"
      @jobs = Job.location
    elsif params[:sort] == "interest"
      @jobs = Job.interest
    elsif params[:location]
      @jobs = Job.city(params[:location])
    else
      @jobs = Job.all
    end
  end

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @category = Category.find_or_create_by(title: params[:job][:category])
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    @job.category = @category

    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @category = Category.find_or_create_by(title: params[:job][:category])
    @job.update(job_params)
    @job.category = @category
    if @job.save
      flash[:success] = "You updated #{@job.title} at #{@job.company.name}"
      redirect_to job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy

    flash[:success] = "You have successfully deleted #{job.title}"
    redirect_to company_path(job.company_id)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end
