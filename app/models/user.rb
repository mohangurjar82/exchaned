class User < ActiveRecord::Base
	ratyrate_rater
	before_save {self.email = email.downcase }
	 validates :username, presence: true, 
	            uniqueness: { case_sensitive: false }, 
	            length: { minimum: 3, maximum: 20 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 50 }, 
	           uniqueness: { case_sensitive: false },
	          format: { with: VALID_EMAIL_REGEX }
	has_secure_password
	  mount_uploader :picture, PictureUploader

	has_many :resources
	has_many :downloaded_resources

	def can_download_resources?
		(resources.count.to_f/downloaded_resources.count.to_f) >= 0.75
	end

	def count_images_to_upload
		(downloaded_resources.count*0.75).ceil - resources.count
	end
end
