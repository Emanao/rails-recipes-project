module ApplicationHelper
    def my_title (text="Recipeshub")
        content_for :title, text
    end
end
