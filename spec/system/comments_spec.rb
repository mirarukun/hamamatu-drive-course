require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER'] 
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe 'コメント投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @spot = FactoryBot.create(:spot)
    @comment_score = '5'
    @comment_text = Faker::Lorem.sentence
  end
  context 'コメント投稿できる時'do
    it 'ログインしたユーザーがスポットを投稿したユーザーでなければ、スポットに対して評価、コメントを投稿できる。' do
      # 新しく作った@user（スポットを投稿していないユーザー）でログインする
      sign_in(@user)
      # 既に投稿されているスポット@spotの名前をクリックしてスポット詳細ページに遷移する
      find_link(@spot.name, href: spot_path(@spot)).click
      # フォームに情報を入力する
      fill_in 'comment[score]', with: @comment_score
      fill_in 'comment[text]', with: @comment_text
      # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Comment.count }.by(1)
      # 詳細ページにリダイレクトされることを確認する
      expect(current_path).to eq(spot_path(@spot))
      # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
      expect(page).to have_content @comment_score
      expect(page).to have_content @comment_text
    end
  end
  context 'コメントを投稿できない時'do
    it 'ログインしていなければ、スポットに対して評価、コメントを投稿できない。' do
      # トップページに遷移する
      basic_pass root_path
      visit root_path
      # スポットの名前をクリックしてスポット詳細ページに遷移する
      find_link(@spot.name, href: spot_path(@spot)).click
      # コメントのフォームと一緒に出る「このスポットに対するあなたの評価も書いてみよう！！」の文字がないことを確認する
      expect(page).to have_no_content ('このスポットに対するあなたの評価も書いてみよう！！')
    end
    it 'ログインしたユーザーがスポットを投稿したユーザーである時は、スポットに対して評価、コメントを投稿できない。' do
     # スポットを投稿したユーザーでログインする
     sign_in(@spot.user)
     # 自分が投稿したスポットの名前をクリックしてスポット詳細ページに遷移する
     find_link(@spot.name, href: spot_path(@spot)).click
     # コメントのフォームと一緒に出る「このスポットに対するあなたの評価も書いてみよう！！」の文字がないことを確認する
     expect(page).to have_no_content ('このスポットに対するあなたの評価も書いてみよう！！')
   end
  end
end