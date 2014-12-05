#encoding: utf-8

require 'spec_helper'

describe Mongoid::LolSortable do
  
  context 'when class has LolSortable module' do
    subject{ Project }

    it { should have_fields(:priority).of_type(Integer).with_default_value_of(30000) }
  end

  describe '#prioritize' do
    let(:project01){ Project.create }
    let(:project02){ Project.create }
    let(:project03){ Project.create }

    before do 
      Project.destroy_all
      Project.prioritize([project03.id, project01.id, project02.id]) 
    end

    subject{ Project.prioritized.to_a }
    
    it{ should eq([project03, project01, project02]) }
  end

end