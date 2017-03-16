module IllnessesHelper
  def imaging_badge(object)
    if !object.empty?
      'badge-success'.html_safe
    else
      'badge-danger'.html_safe
    end
  end
end
