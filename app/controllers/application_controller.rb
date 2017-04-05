class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :category_names

  CATEGORIES = {    'Tema F' => 'Hæmatologi, onkologi og plastikkirurgi',
                    'Tema G' => 'Gastroenterologi',
                    'Tema H' => 'Nefro-Urologi',
                    'Tema E' => 'Hjerte-kar sygdomme'}

  def category_names
    @category_names = CATEGORIES
  end
end
