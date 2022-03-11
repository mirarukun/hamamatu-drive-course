require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER'] 
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe 'スポット登録', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @spot = FactoryBot.create(:spot)
  end
  context 'スポット登録ができるとき'do
    it 'ログインしたユーザーはスポット登録ができる' do
      # ログインする
      basic_pass root_path
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード（6文字以上）', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 「スポットを投稿する」ボタンがあることを確認する
      expect(page).to have_content('スポットを投稿する')
      # スポット登録ページに移動する
      visit new_spot_path
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('spot[image]', image_path)
      # フォームに情報を入力する
      fill_in 'spot-name', with: @spot.name
      fill_in 'spot-score', with: @spot.score
      fill_in 'spot-info', with: @spot.text
      select @spot.genre.name, from:'spot[genre_id]'
      select @spot.time_required.name, from:'spot[time_required_id]'
      select @spot.situation.name, from:'spot[situation_id]'
      select @spot.direction.name, from:'spot[direction_id]'
      # 「スポットを登録する」ボタンを押すとSpotモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Spot.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # トップページには先ほど登録したスポットが存在することを確認する（スポット名）
      expect(page).to have_content(@spot.name)
      # トップページには先ほど登録したスポットの点数が存在することを確認する（スポットの点数）
      expect(page).to have_content(@spot.score)
    end
  end
  context 'スポット登録ができないとき'do
    it 'ログインしていないとスポット登録ページに遷移できない' do
      # トップページに遷移する
      basic_pass root_path
      visit root_path
      # 「スポットを投稿する」のボタンがないことを確認する
      expect(page).to have_no_content('スポットを投稿する')
    end
  end
end