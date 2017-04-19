class QuizzesController < ApplicationController
  add_breadcrumb "<span class='lead' style='font-size: medium;'>Forsiden</span>".html_safe, :root_path

  def summary
    @no_bar = true
    #add_breadcrumb "<span class='lead' style='font-size: medium;'>Opsummering</span>".html_safe
  end

  def reset_game
    start_new_game
    redirect_to quizzes_show_path
  end

  def show
    @no_bar = true
    #add_breadcrumb "<span class='lead' style='font-size: medium;'>Quiz</span>".html_safe
    start_new_game if session[:score].nil? || session[:wrong_answers].nil? || session[:summary].nil?

    @last_correct = Illness.find(session[:last_correct]) unless session[:last_correct].nil?
    prepare_case
  end

  def check_answer
    session[:summary] << [session[:correct].to_i, params[:answer].to_i, session[:case].to_i]
    session[:last_correct] = session[:correct]
    respond_to do |format|
      if params[:answer].to_i == session[:correct]
        #sleep(0.3.second)
        session[:score] += 1
        session[:was_answer_correct] = true
        return redirect_to quizzes_summary_path if game_over?
        format.html { redirect_to quizzes_show_path }
      else
        #sleep(0.3.second)
        session[:wrong_answers] += 1
        session[:was_answer_correct] = false
        return redirect_to quizzes_summary_path if game_over?
        format.html { redirect_to quizzes_show_path }
     end
    end
  end

  private
  def start_new_game
    reset_session
    session[:start_time] = Time.current
    session[:score] = 0
    session[:wrong_answers] = 0
    session[:summary] = []
    session[:size] = 10
    session[:case] = 0
  end

  def game_over?
    return true if session[:score] + session[:wrong_answers] >= session[:size]
    false
  end

  def prepare_case(amount = 4)
    # Find a random case.
    @case = Case.order('RANDOM()').first
    # Tell the session which case is used
    session[:case] = @case.id
    # Find some random illnesses
    @illnesses = Illness.where.not(id: @case.illness_id).first(amount - 1)
    # Append the correct illness
    @illnesses << Illness.find(@case.illness_id)
    # Shuffle it up a bit
    @illnesses.shuffle!
    # Tell the session which illness is the correct answer
    session[:correct] = @case.illness_id
  end

end