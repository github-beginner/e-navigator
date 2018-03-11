class InterviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_interview, only: [:show, :edit, :update, :destroy]

  # GET /interviews
  def index
    @user = User.find(params[:id])
    unless current_user == @user
      render :index_for_others
    end
  end

  # GET /interviews/1
  def show
  end

  # GET /interviews/new
  def new
    @interview = current_user.interviews.new
  end

  # GET /interviews/1/edit
  def edit
  end

  # POST /interviews
  def create
    @interview = current_user.interviews.new(interview_params)
    if @interview.save
      redirect_to @interview, notice: '登録に成功しました。'
    else
      render :new 
    end
  end

  # PATCH/PUT /interviews/1
  def update
    Interview.where(user_id: params[:user_id]).where(availability: 'accept').update_all(availability: 'reject')
    if @interview.update(interview_params)
      redirect_to @interview, notice: '更新に成功しました。'
    else
      render :edit 
    end
  end

  # DELETE /interviews/1
  def destroy
    @interview.destroy
    redirect_to interviews_url, notice: '削除に成功しました。'
  end

  def index_for_others
    @user = User.find_by(params[:user_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview
      @interview = Interview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_params
      p params
      params.require(:interview).permit(:date, :availability)
    end
end
