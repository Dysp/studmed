class QuizzesController < ApplicationController
  add_breadcrumb "<span class='lead' style='font-size: medium;'>Forsiden</span>".html_safe, :root_path
  @last_correct = nil
  def show
    add_breadcrumb "<span class='lead' style='font-size: medium;'>Quiz</span>".html_safe
    @last_correct = Illness.find(session[:last_correct]) unless session[:last_correct].nil?
    @illnesses = Illness.order('RANDOM()').first(4)
    @correct = @illnesses.sample
    session[:correct] = @correct.id
    session[:score] = 0 if session[:score].nil?
    session[:wrong_answers] = 0 if session[:wrong_answers].nil?
  end

  def check_answer
    unless game_over?
      respond_to do |format|
        if params[:answer].to_i == session[:correct]
          sleep(0.3.second)
          session[:last_correct] = session[:correct]
          session[:score] += 1
          session[:was_answer_correct] = true
          format.html { redirect_to quizzes_show_path, last_correct: @last_correct, notice: "Svaret er korrekt!" }
        else
          sleep(0.3.second)
          session[:last_correct] = session[:correct]
          session[:wrong_answers] += 1
          session[:was_answer_correct] = false
          format.html { redirect_to quizzes_show_path, last_correct: @last_correct, notice: "Forkert." }
        end
      end
    else
      session[:score] = 0
      session[:wrong_answers] = 0
      redirect_to root_path, notice: "Tillykke, du har fået 10 rigtige."
    end

  end

  private

  def game_over?
    unless session[:score].nil?
      return true if session[:score] > 9.0
    else
      false
    end
  end

end