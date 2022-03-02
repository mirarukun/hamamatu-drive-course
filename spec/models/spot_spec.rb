require 'rails_helper'

RSpec.describe Spot, type: :model do
  before do
    @spot = FactoryBot.build(:spot)
  end

  describe 'スポット登録' do
    context 'スポットを登録できる場合' do
      it '必要な情報を適切に入力して「スポットを登録する」ボタンを押すと、スポット情報がデータベースに保存される' do
        expect(@spot).to be_valid
      end
      it '画像がなくても保存できる' do
        @spot.image = nil
        expect(@spot).to be_valid
      end
    end

    context 'スポットを登録できない場合' do
      it 'スポット名が記入されていないと保存できない' do
        @spot.name = ''
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Name can't be blank")
      end
      it 'スポットの点数が記入されていないと保存できない' do
        @spot.score = ''
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Score can't be blank")
      end
      it 'スポットの点数は、0より低いと保存できない' do
        @spot.score = '-1'
        @spot.valid?
        expect(@spot.errors.full_messages).to include('Score is not included in the list')
      end
      it 'スポットの点数は、10より高いと保存できない' do
        @spot.score = '11'
        @spot.valid?
        expect(@spot.errors.full_messages).to include('Score is not included in the list')
      end
      it 'スポットの点数は半角数値でなければ保存できない' do
        @spot.score = '５'
        @spot.valid?
        expect(@spot.errors.full_messages).to include('Score is not a number')
      end
      it 'スポットの説明が記入されていないと保存できない' do
        @spot.text = ''
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Text can't be blank")
      end
      it 'スポットのジャンルが選択されていないと保存できない' do
        @spot.genre_id = '--'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Genre is invalid")
      end
      it 'スポットに到着するまでの所要時間が選択されていないと保存できない' do
        @spot.time_required_id = '--'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Time required is invalid")
      end
      it 'スポットのおすすめの時間帯が選択されていないと保存できない' do
        @spot.situation_id = '--'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Situation is invalid")
      end
      it 'スポットの方角が選択されていないと保存できない' do
        @spot.direction_id = '--'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Direction is invalid")
      end
      it 'userが紐付いていなければ出品できない' do
        @spot.user = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include('User must exist')
      end
    end
  end
end
