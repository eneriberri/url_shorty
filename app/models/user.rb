class User < ActiveRecord::Base
   attr_accessible :email
   validates :email, :presence => true

   has_many(
     :submitted_urls,
     class_name: "ShortenedUrl",
     foreign_key: :submitter_id,
     primary_key: :id
   )

   #has_many visited urls

   has_many(
     :visits,
     class_name: "Visit",
     foreign_key: :visitor_id,
     primary_key: :id
   )

   has_many :visited_urls, :through => :visits, :source => :shortened_url
end
