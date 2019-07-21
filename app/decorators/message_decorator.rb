module MessageDecorator
  def received_at
    ampm = created_at.hour < 12 ? "午前" : "午後"
    created_at.strftime("#{ampm} %I:%M")
  end
end
