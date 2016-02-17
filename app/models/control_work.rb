class ControlWork < ActiveRecord::Base
  belongs_to :period
  belongs_to :user
  has_attached_file :cw_archive
  validates_attachment_content_type :cw_archive,
                                    content_type: ['application/zip', 'application/x-rar-compressed']
end
