module ApplicationHelper
  def l(*args)
    I18n.localize(*args) unless args.first.nil?
  end
end
