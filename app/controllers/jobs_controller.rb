class JobsController < ApplicationController

  def index
    @jobs = Job.all
    json_response(@jobs)
  end

  def show
    @job = Job.find(params[:id])
    json_response(@job)
  end

  private

  def job_params
    params.permit(:title, :description, :company, :location, :technologies,:logo,:position)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
