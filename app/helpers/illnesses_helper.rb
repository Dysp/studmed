module IllnessesHelper
  def imaging_badge(object)
    if !object.empty?
      'btn-outline-primary'.html_safe
    else
      'btn-outline-danger'.html_safe
    end
  end

  def imaging_indicated(model)
    ignored_attrs = {'id' => 1, 'created_at' => 1, 'updated_at' => 1}
    model.attributes.all?{|k,v| v.blank? || ignored_attrs[k]}
  end

end