class Rule < ActiveRecord::Base
  belongs_to :ad
  belongs_to :ruleset
end
