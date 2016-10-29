class Locality < ActiveRecord::Base
  belongs_to :county

  def countee(loc)
    County.find_by_id(loc.county_id)
  end

end
