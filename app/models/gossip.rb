class Gossip < ApplicationRecord
  belongs_to :user
  has_many :tag_gossips
  has_many :tags, through: :tag_gossips
  validates :content, presence: true
  validates :title, length: { in: 6..20 }, presence: true


    def self.find(id)
      gossip = Gossip.find_by(id:id)
      return gossip 
    end
 


end
