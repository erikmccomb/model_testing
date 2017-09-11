class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name
  has_many :posts, dependent: :destroy

  # useage
  # def index
  #   @users = User.all.by_last_name
  # end

  def self.by_last_name(asc = true)
    # order by descending instead of default ascending
    # order(last_name: :desc)
    # ---------------------
    # if asc
    #   order(:last_name)
    # else
    #   order(last_name: :desc)
    # end
    # ----------------------
    asc ? order(:last_name) : order(last_name: :desc)
  end

  def info
    "#{email} has signed in: #{sign_in_count} times"
  end

  def full_name
    "#{last_name}, #{first_name}"
  end

  def display_name
    "#{first_name} #{last_name}"
  end

  def has_signed_in?
    sign_in_count > 0
  end
end