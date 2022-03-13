require 'rails_helper'

RSpec.describe 'コメント投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @spot = FactoryBot.create(:spot)
    @comment = FactoryBot.create(:comment)
  end
  context 'コメント投稿できる時'do
    it 'ログインしたユーザーがスポットを投稿したユーザーでなければ、スポットに対して評価、コメントを投稿できる。' do
      # ログインする
      sign_in(@user)
      # スポット詳細ページに遷移する
      visit spot_path(@spot)
      # フォームに情報を入力する
      fill_in 'comment[score]', with: @comment.score
      fill_in 'comment[text]', with: @comment.text
      # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Comment.count }.by(1)
      # 詳細ページにリダイレクトされることを確認する
      expect(current_path).to eq(spot_path(@spot))
      # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
      expect(page).to have_content @comment.score
      expect(page).to have_content @comment.text
    end
  end
  context 'コメントを投稿できない時'do
    it 'ログインしていなければ、スポットに対して評価、コメントを投稿できない。' do

    end
    it 'ログインしたユーザーがスポットを投稿したユーザーである時は、スポットに対して評価、コメントを投稿できない。' do
    end
  end
end