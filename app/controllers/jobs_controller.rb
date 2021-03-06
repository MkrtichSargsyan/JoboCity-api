class JobsController < ApplicationController

  skip_before_action :authorized

  def index
    @jobs = Job.all
    # json_response(@jobs)
    render json: @jobs
  end

  def show
    @job = Job.find(params[:id])
    # json_response(@job)
    render json: @job
  end

  private

  def job_params
    params.permit(:title, :description, :company, :location, :technologies, :logo, :position)
  end
end
