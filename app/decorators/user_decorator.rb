module UserDecorator
  def gender_with_icon
    case gender
    when 'male'
      icon = '<i class="fas fa-male text-secondary mr-2"></i>'
    when 'female'
      icon = '<i class="fas fa-female text-danger mr-2"></i>'
    end
    "#{icon}#{gender_i18n}".html_safe
  end
end
