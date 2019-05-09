module Turnip
  # In this module should be combined common turnip steps
  module Steps
    # PUT GLOBAL STEPS HERE
  end
end

# This module combines turnip steps for example.feature
module MonsterSteps

end

RSpec.configure { |c| c.include MonsterSteps, monster_steps: true }
