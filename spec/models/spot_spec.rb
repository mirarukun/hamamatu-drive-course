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
        expect(@spot.errors.full_messages).to include("スポット名を入力してください")
      end
      it 'スポットの点数が記入されていないと保存できない' do
        @spot.score = ''
        @spot.valid?
        expect(@spot.errors.full_messages).to include("評価点を入力してください", "評価点は一覧にありません", "評価点は不正な値です", "評価点は数値で入力してください")
      end
      it 'スポットの点数は、0より低いと保存できない' do
        @spot.score = '-1'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("評価点は一覧にありません", "評価点は不正な値です")
      end
      it 'スポットの点数は、10より高いと保存できない' do
        @spot.score = '11'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("評価点は一覧にありません")
      end
      it 'スポットの点数は半角数値でなければ保存できない' do
        @spot.score = '５'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("評価点は数値で入力してください")
      end
      it 'スポットの説明が記入されていないと保存できない' do
        @spot.text = ''
        @spot.valid?
        expect(@spot.errors.full_messages).to include("説明文を入力してください")
      end
      it 'スポットのジャンルが選択されていないと保存できない' do
        @spot.genre_id = '--'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("スポットのジャンルを、一つ選択して下さい")
      end
      it 'スポットに到着するまでの所要時間が選択されていないと保存できない' do
        @spot.time_required_id = '--'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("スポットに到着するまでの所要時間を、一つ選択して下さい")
      end
      it 'スポットのおすすめの時間帯が選択されていないと保存できない' do
        @spot.situation_id = '--'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("どの時間帯に行くのがおすすめかを、一つ選択して下さい")
      end
      it 'スポットの方角が選択されていないと保存できない' do
        @spot.direction_id = '--'
        @spot.valid?
        expect(@spot.errors.full_messages).to include("どちらの方角にあるかを、一つ選択して下さい")
      end
      it 'userが紐付いていなければスポット登録できない' do
        @spot.user = nil
        @spot.valid?
        expect(@spot.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
