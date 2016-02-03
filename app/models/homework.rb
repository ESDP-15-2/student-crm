class Homework < ActiveRecord::Base
  has_attached_file :hw_archive
  validates_attachment_content_type :hw_archive,
                                    content_type: ['application/zip', 'application/x-rar-compressed']
end
