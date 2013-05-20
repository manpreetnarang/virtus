require 'spec_helper'

describe Virtus::Options, '#accept_options' do
  class Model
    extend DescendantsTracker
    extend Virtus::Options
  end

  let(:object)     { Model.dup         }
  let(:descendant) { Class.new(object) }
  let(:new_option) { :width            }

  before do
    object.accept_options(new_option)
  end

  it 'does not have accepted options by default' do
    Model.accepted_options.should_not include(new_option)
  end

  it 'sets new accepted options on itself' do
    object.accepted_options.should include(new_option)
  end

  it 'sets new accepted option on its descendants' do
    descendant.accepted_options.should include(new_option)
  end

  it 'creates option accessors' do
    object.should respond_to(new_option)
  end

  it 'creates option accessors on descendant' do
    descendant.should respond_to(new_option)
  end
end
