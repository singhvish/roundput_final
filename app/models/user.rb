class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  has_many :reviews, dependent: :destroy

  has_one_attached :avatar

  has_many :evaluations, class_name: "RSEvaluation", as: :source

	has_reputation :votes, source: {reputation: :votes}, aggregated_by: :sum

  def voted_for?(circular_initiative)
    evaluations.where(target_type: circular_initiative, target_id: circular_initiative.id).present?
  end
end
