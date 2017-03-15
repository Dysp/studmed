module IllnessesHelper
  def imaging_badge(object, icon)
    case icon
    when :mri
      if !object.mri.empty?
      'badge-success'.html_safe
      else
      'badge-danger'.html_safe
      end
    when :xray
      if !object.xray.empty?
      'badge-success'.html_safe
      else
      'badge-danger'.html_safe
      end
    when :ct
      if !object.ct.empty?
      'badge-success'.html_safe
      else
      'badge-danger'.html_safe
      end
    when :pet
      if !object.pet.empty?
      'badge-success'.html_safe
      else
      'badge-danger'.html_safe
      end
    when :pet_mri
      if !object.pet_mri.empty?
      'badge-success'.html_safe
      else
      'badge-danger'.html_safe
      end
    when :ultrasound
      if !object.ultrasound.empty?
        'badge-success'.html_safe
      else
        'badge-danger'.html_safe
      end
    end
  end
end
