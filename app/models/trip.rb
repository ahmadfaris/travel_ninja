class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :itineraries
  has_many :addons


  accepts_nested_attributes_for :itineraries,
                                reject_if: proc { |attributes| attributes['name'].blank? },
                                allow_destroy: true
  accepts_nested_attributes_for :addons,
                                reject_if: proc { |attributes| attributes['name'].blank? },
                                allow_destroy: true


  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
