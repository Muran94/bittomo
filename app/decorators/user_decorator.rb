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

  def appropriate_avatar_url(size: :default)
    return 'no-user.png' if avatar.blank?
    case size.to_sym
    when :default
      avatar.url
    when :thumb
      avatar.thumb.url
    end
  end
end
