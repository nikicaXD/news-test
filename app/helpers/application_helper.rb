module ApplicationHelper
    def image(image, size=150)
        if image.attached?
            image.variant(resize: "#{size}x#{size}!")
        end
    end
end
