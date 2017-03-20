module IllnessesHelper
  def imaging_badge(object)
    if !object.empty?
      'btn-outline-primary'.html_safe
    else
      'btn-outline-danger'.html_safe
    end
  end

  def imaging_indicated
    #TODO: Virker ikke. Returnerer altid true eller false.
    if !@test.nil?
      @test.attributes.all? do |key, value|
        key.inspect
      end
    end
  end
end