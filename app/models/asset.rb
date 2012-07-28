class Asset < ActiveRecord::Base

  attr_accessible :asset_content_type, :asset_file_name, :asset_file_size, :asset_updated_at, :searchapp_id, :asset, :content
  belongs_to :searchapp
  has_attached_file :asset
  validates_attachment :asset, :presence => true,
  :content_type => { :content_type => ['application/pdf', 'application/msword', 'text/plain', 'application/rtf', 'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document','application/x-vnd.oasis.opendocument.text', 'application/vnd.oasis.opendocument.text', 'application/' ] },
  :size => { :in => 0..2000.megabytes }


end

