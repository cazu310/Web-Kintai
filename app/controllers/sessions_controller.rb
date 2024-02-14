class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    if params[:session].present?
      employee = Employee.find_by(login_id: params[:session][:login_id])      
      if employee
        log_in employee
        puts "ここ通った1"
        redirect_to employee_path(employee), notice: 'ログイン成功しました。'
      else
        flash.now[:danger] = 'ログインIDかパスワードが間違っています'
        @errorMessage = flash.now[:danger]
        puts "ここ通った2"
        render 'new'
      end
    else
      flash.now[:danger] = 'ログインIDかパスワードが間違っています'
      @errorMessage = flash.now[:danger]
      puts "ここ通った3"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    puts '==== After log_out ===='
    puts "session[:employee_id]: #{session[:employee_id]}"
    puts "@current_employee: #{@current_employee}"
    redirect_to new_session_path, notice: 'ログアウトしました。'
  end
  
  def log_out
    session.delete(:employee_id)  # セッションからユーザーの情報を削除
    @current_employee = nil  # ユーザー情報をクリア
  end
end
