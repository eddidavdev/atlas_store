class Banner < ApplicationRecord
    validates_presence_of [:title,  :link , :description]
    has_one_attached :image
    has_rich_text :description

    def image_as_thumbnail(size = 225)
        image.variant(resize_to_fill: [nil, size]).processed
    end
end
