class QuizzesController < ApplicationController
  add_breadcrumb "<span class='lead' style='font-size: medium;'>Forsiden</span>".html_safe, :root_path
  @score = 0

  def show
    add_breadcrumb "<span class='lead' style='font-size: medium;'>Quiz</span>".html_safe

    @illnesses = Illness.order('RANDOM()').first(4)
    @correct = @illnesses.sample
    session[:correct] = @correct.id
  end

  def check_answer
    unless game_over?
      respond_to do |format|
        record_post_time
        format.html { redirect_to quizzes_show_path, notice: "Too many comments makes you a busy cat!" }if post_check
        if params[:answer].to_i == session[:correct]
          sleep(0.3.second)
          session[:score] += 1
          format.html { redirect_to quizzes_show_path, notice: "Svaret er korrekt!" }
        else
          sleep(0.3.second)
          format.html { redirect_to quizzes_show_path, notice: "Forkert." }
        end
      end
    else
      session[:score] = 0
      redirect_to root_path, notice: "Tillykke, du har fået 10 rigtige."
    end

  end

  private

  MIN_POST_TIME = 25.seconds
  def post_check
    return true if (Time.now - last_post_time) > MIN_POST_TIME
    return false
  end

  def last_post_time
    Time.at((cookies[:last_post_at].to_i rescue 0))
  end

  def record_post_time
    cookies[:last_post_at] = Time.now.to_i
  end

  def game_over?
    unless session[:score].nil?
      return true if session[:score] > 9.0
    else
      false
    end
  end

end