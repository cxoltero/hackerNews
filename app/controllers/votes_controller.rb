class VotesController < ApplicationController
  def index
    @votes = Vote.all
    render json: @votes
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      render json: @vote, status: :created, location: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  def show
    @vote = Vote.find(params[:id])
  end


  def update
    @vote = Vote.find(params[:id])

    if @vote.update(vote_params)
      render json: @vote, status: :created, location: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @vote = vote.find(params[:id])
    @vote.destroy

    render json: @vote, status: :created, location: @vote
  end



  private

  def vote_params
     params.require(:vote).permit(:user_id, :submission_id, :comment_id, :value)
  end

end
