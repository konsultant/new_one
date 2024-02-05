require 'rails_helper'

#RSpec.describe Tag, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
#end

RSpec.describe Tag, type: :model do
  let(:title) { "Title" }
  let(:email) { "bob@email.com" }
  let(:user) { User.new(email: email) }
  let(:expected_result) { "#{title} - #{email}" }
  subject { Tag.new(user: user, title: title) }

  context "#formatted_title" do
    it 'returns correct' do 
      expect(subject.formatted_title).to eq(expected_result)
    end
  end
  
  
  # it 'returns title' do 
  #   tag = 
  #   expect(tag.title).to eq('Lost lord')
  # end

end
