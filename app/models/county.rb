class County < ActiveRecord::Base
  belongs_to :state
  has_many :localities, dependent: :destroy

  def localitied?
    self.localities.present? == true
  end

  def staight(countee)
    State.find_by_id(countee.state_id)
  end

end
