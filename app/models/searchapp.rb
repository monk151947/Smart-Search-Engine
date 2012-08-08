class Searchapp < ActiveRecord::Base
  require 'yomu'
  has_many :assets
  attr_accessible :content, :file_name
  attr_accessible :assets_attributes
  accepts_nested_attributes_for :assets, :allow_destroy=> true
  after_create :doc_text



define_index do
  indexes file_name
  indexes content
  indexes assets.content, :as => :asset_content
end


  def doc_text
    self.assets.each do |asset|
    yomu = Yomu.new  "#{asset.asset.path}"
    text = yomu.text
    asset.content = text
    asset.save
   end
   system("rake ts:index RAILS_ENV=development")
  end
end

