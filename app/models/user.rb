class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
  has_many :orders
  has_many :posts, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one_attached :avatar
  has_one_attached :cover_photo
  has_many :favorites

  paginates_per 10

  def published_products
    self.posts.count
  end

  def sold_products
    @posts = self.posts
    OrderDetail.where(post_id: @posts.ids).count
  end

  def bought_produtcs
    @orders = self.orders
    OrderDetail.where(order_id: @orders.ids).count
  end

  SEARCH_ATTRS = %i[first_name last_name]

  scope :search_query, lambda { |query| self.class.search(query) }

  def self.search(search)
    results = []

    SEARCH_ATTRS.each do |attr|
      results += self.where("#{attr} ~* ?", search.to_s)
    end

    results
  end
end

