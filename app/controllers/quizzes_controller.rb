class QuizzesController < ApplicationController
  add_breadcrumb "<span class='lead' style='font-size: medium;'>Forsiden</span>".html_safe, :root_path

  def summary
  end

  def reset_game
    start_new_game
    redirect_to quizzes_show_path
  end

  def show
    add_breadcrumb "<span class='lead' style='font-size: medium;'>Quiz</span>".html_safe
    start_new_game if session[:score].nil? || session[:wrong_answers].nil? || session[:summary].nil?

    @last_correct = Illness.find(session[:last_correct]) unless session[:last_correct].nil?
    @illnesses = get_illnesses(4)
    @correct = @illnesses.sample
    session[:correct] = @correct.id
  end

  def check_answer
    unless game_over?
      session[:summary].merge!({ session[:correct] => params[:answer] })
      respond_to do |format|
        if params[:answer].to_i == session[:correct]
          sleep(0.3.second)
          session[:last_correct] = session[:correct]
          session[:score] += 1
          session[:was_answer_correct] = true
          format.html { redirect_to quizzes_show_path }
        else
          sleep(0.3.second)
          session[:last_correct] = session[:correct]
          session[:wrong_answers] += 1
          session[:was_answer_correct] = false
          format.html { redirect_to quizzes_show_path }
        end
      end
    else
      redirect_to quizzes_summary_path
    end
  end

  private
  def start_new_game
    session[:start_time] = Time.current
    session[:score] = 0
    session[:wrong_answers] = 0
    session[:summary] = {}
  end

  def game_over?
    unless session[:score].nil?
      return true if session[:score] + session[:wrong_answers] > 5.0
    else
      false
    end
  end

  def get_illnesses(amount)
    Illness.order('RANDOM()').first(amount)
  end

end