class ShortUrl < ApplicationRecord
    has_many :geolocations, dependent: :destroy

    validates  :target_url, 
                presence: true, 
                length: { maximum: 255 }, 
                format: URI::regexp(%w[http https])
    validates_uniqueness_of :short_path

end
