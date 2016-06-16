module ApplicationHelper
  def full_title page_title = ""
    base_title = t "pages.my_web"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end
end
