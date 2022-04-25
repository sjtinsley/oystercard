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

  it 'deducts the fare from the Oyster balance' do
    subject.top_up(10)
    subject.deduct(4)
    expect(subject.balance).to eq 6
  end

  it 'the user can touch in only once' do
    subject.touch_in
    expect{ subject.touch_in }.to raise_error
  end

  it 'the user can touch in and then is on journey' do
    subject.touch_in
    expect(subject.in_journey?).to be_truthy
  end

  it 'user cannot touch out an Oystercard not on a journey' do
    expect{ subject.touch_out }.to raise_error
  end

  it 'user can touch out and is then not on a journey' do
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey?).to be_falsey
  end

  context 'when the user has the minimum balance for a single journey' do
    it 'lets them touch in' do
      subject.top_up(5)
      expect{ subject.touch_in }.not_to raise_error
    end
  end

  context 'when the user doesn\'t have the minimum balance for a single journey' do
    it 'doesn\'t let them touch in' do
      expect{ subject.touch_in }.to raise_error
    end
  end
  
end
