#encoding: utf-8

require 'spec_helper'

describe SortableController do
  describe '#prioritize' do
    let(:project01){ Project.create }
    let(:project02){ Project.create }
    let(:project03){ Project.create }

    context 'when success' do
      before{ post :prioritize, resource: 'project', ids: [project02.id, project03.id, project01.id], format: 'json' }

      it{ response.status.should eq(200) }
      it{ Project.prioritized.should eq([project02, project03, project01]) }
    end

    context 'when resource doesnt exist' do
      before{ post :prioritize, resource: 'bla', ids: [project02.id, project03.id, project01.id], format: 'json' }
      
      it { response.status.should eq(500)}
      it { response.body.should =~ /error_message/}
      it { response.body.should =~ /uninitialized constant Bla/ }
    end

    context 'when doesnt has ids list' do
      before{ post :prioritize, resource: 'project', ids: [], format: 'json' }

      it { response.status.should eq(500)}
      it { response.body.should =~ /error_message/}
      it { response.body.should =~ /must send ids params with resources listed/}
    end
  end
end