class InterviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_interview, only: [:show, :edit, :update, :destroy]

  # GET /interviews
  def index
    p params
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
    if @interview.update(interview_params)
      if interview_params[:availability] == 'accept'
        request_user = User.find(params[:user_id])
        interviewer = current_user
        decision_email(request_user, interviewer)
      end
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

  def send_request_email
    interviewer = User.find(request_email_params[:id])
    request_user = current_user
    UserMailer.request_email(interviewer, request_user).deliver_later
    redirect_to interviews_url(id: current_user.id), notice: '面接日程が申請されました。'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview
      @interview = Interview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_params
      params.require(:interview).permit(:date, :availability)
    end

    def request_email_params
      params.require(:user).permit(:id)
    end

    def decision_email(request_user, interviewer)
      UserMailer.decision_email_for_interviewer(request_user, interviewer).deliver_later
      UserMailer.decision_email_for_request_user(request_user, interviewer).deliver_later
    end

end
