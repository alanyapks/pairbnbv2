class Listing < ActiveRecord::Base
	searchkick
	belongs_to :user
  has_many :reservations, :dependent => :destroy 
	mount_uploaders :photos, AvatarUploader

	# Assuming country_select is used with User attribute `country_code`
  # This will attempt to translate the country name and use the default
  # (usually English) name if no translation is available
  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end
end
