require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメントを投稿できる場合' do
      it '必要な情報を適切に入力して「このスポットの評価を投稿」ボタンを押すとコメントと評価点を投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントを投稿できない場合' do
      it 'スポットの評価点が記入されていないと投稿できない' do
        @comment.score = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Score can't be blank")
      end
      it 'スポットの評価点は、0より低いと保存できない' do
        @comment.score = '-1'
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Score is not included in the list')
      end
      it 'スポットの評価点は、10より高いと保存できない' do
        @comment.score = '11'
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Score is not included in the list')
      end
      it 'スポットの評価点は半角数値でなければ保存できない' do
        @comment.score = '５'
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Score is not a number')
      end
      it 'コメントのテキストが記入されていないと保存できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'userが紐付いていなければコメントを投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
      it 'spotが紐付いていなければコメントを投稿できない' do
        @comment.spot = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Spot must exist')
      end
    end
  end
end
