require 'oystercard'
describe Oystercard do
  it 'tests that a new card has a balance of 0' do
    expect(subject.balance).to eq 0
  end

  it 'user can add money to Oystercard and it goes onto the balance' do
    subject.top_up(5)
    expect(subject.balance).to eq 5
  end

  it 'raises an error if users balance goes more than 90' do
    subject.top_up(70)
    expect{ subject.top_up(25) }.to raise_error
  end

end
