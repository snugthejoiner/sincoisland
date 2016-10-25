class State < ActiveRecord::Base
  has_many :counties, dependent: :destroy

  def smart_alpha
    self.name.sub(/^the /i, "").sub(/[()]/, "")
  end

  def self.sorted_by_smart_alpha
    State.all.sort_by(&:smart_alpha)
  end

end
