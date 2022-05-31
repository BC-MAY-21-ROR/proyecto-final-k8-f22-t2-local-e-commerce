class Post < ApplicationRecord
  has_many :post_comments
  has_many :orders, through: :order_details
  has_many :order_details
  has_many :carts
  has_many :schedules
  has_many :reservations 
  has_many_attached :picture
  belongs_to :user
  has_many :favorites

  scope :active, -> { where(:status_id => 1)}
  # Ex:- scope :active, -> {where(:active => true)}

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  validates :delivery, presence: true
  validates :picture, presence: true
  validates :title, length: { maximum: 30 }

  enum delivery: {
    "Entrega a domicilio": 0,
    "Retiro en tienda": 1,
    "Punto medio": 2
  }

  def get_ranking
    self.post_comments.average(:ranking)
  end
  def self.delete(post)
    Post.where(id: post.id).update(status_id: 2)
  end
  SEARCH_ATTRS = %i[title description]
  scope :search_query, lambda { |query| self.class.search(query) }
  def self.search(search)
    results = []
    SEARCH_ATTRS.each do |attr|
      results += self.where("#{attr} ~* ?", search.to_s)
    end
    results.uniq
  end

  def owner?(current_user)
    self.user == current_user
  end
end
