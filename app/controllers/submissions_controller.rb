class SubmissionsController < ApplicationController
  def index
    @submissions = Submission.all
    render json: @submissions
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submission_params)

    if @submission.save
      render json: @submission, status: :created, location: @submission
    else
      render json: @submission.errors, status: :unprocessable_entity
    end
  end

  def show
    @submission = Submission.find(params[:id])

    if @submission
      render json: @submission, status: :created, location: @submission
    else
      render json: @submission.errors, status: :unprocessable_entity
    end
  end


  def update
    @submission = Submission.find(params[:id])

    if @submission.update(submission_params)
      render json: @submission, status: :created, location: @submission
    else
      render json: @submission.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy

    render json: @submission, status: :created, location: @submission
  end



  private

  def submission_params
     params.require(:submission).permit(:user_id, :title, :url, :body)
  end

end
