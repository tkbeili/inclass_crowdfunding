class Campaign < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :details, :target, :end_date

  geocoded_by :address
  after_validation :geocode

  serialize :details

  extend FriendlyId
  friendly_id :title, use: :slugged

  # validate :has_a_reward_level

  has_many :comments, as: :commentable
  has_many :reward_levels, dependent: :destroy

  accepts_nested_attributes_for :reward_levels, allow_destroy: true,
    reject_if: proc {|x| x[:amount].blank? && x[:title].blank? && x[:details].blank? }

  scope :published, -> { where(state: :published) }

  state_machine :state, initial: :draft do

    event :publish do
      transition draft: :published
    end

    event :complete do
      transition published: :target_met
    end

    event :expire do
      transition target_met: :succeeded, published: :failed
    end

    event :cancel do
      transition [:draft, :published, :target_met] => :canceled
    end

    after_transition on: :canceled, do: :refund_all_pledges

  end

  # def to_param
  #   "#{id}-#{title}".parameterize
  # end

  def refund_all_pledges
    # code to schedule bg task to refund all
  end

  private

  def has_a_reward_level
    if reward_levels.size < 1
      errors.add(:base, "Must put at least one reward level")
    end
  end




end