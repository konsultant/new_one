require 'rails_helper'
RSpec.describe UserBalance do
    let(:sum) { 10 }
    let(:num) { 7 }
    let(:user) { User.new(email: email) }
    let(:expected_result) { "#{sum}"}
    subject { UserBalance.new() }
  
    context "#puts_balance" do
      it 'returns correct' do 
        expect(subject.puts_balance(sum)).to eq(10)
      end
    end  
    context "#set_balance" do
        it 'returns correct' do 
          expect(subject.set_balance(sum)).to eq(10)
        end
      end 
      context "#transfer_sum" do
        it 'returns correct' do 
          expect(subject.transfer_sum(num)).to eq(3)
        end
      end 
end