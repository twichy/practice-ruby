class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  validates :content_type, presence: true
  validates :filename, presence: true
  validates :file_contents, presence: true
  validate :valid_file_name_extension

  private
    def valid_file_name_extension
      if content_type != "image/png"
        errors[:base] << "Invalid image format"
      end
    end
end
