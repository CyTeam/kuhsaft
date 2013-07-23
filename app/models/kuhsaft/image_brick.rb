module Kuhsaft
  class ImageBrick < Brick
    mount_uploader :image, Kuhsaft::ImageBrickImageUploader

    validates :image, :presence => true
    validates :image_size, :presence => true

    after_save :resize_image_if_size_changed

    def resize_image_if_size_changed
      image.recreate_versions! if image_size_changed? && image_present?
    end

    def collect_fulltext
      [super, caption].join(' ')
    end

    def user_can_add_childs?
      false
    end

    def image_present?
      image.present?
    end
  end
end
