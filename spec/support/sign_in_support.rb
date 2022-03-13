module SignInSupport
  def basic_pass(path)
    username = ENV['BASIC_AUTH_USER'] 
    password = ENV['BASIC_AUTH_PASSWORD']
    visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
  end
  
  def sign_in(user)
     # スポット一覧ページ(トップページ)に移動する
    basic_pass root_path
    visit root_path
    # スポット一覧ページにログインページへ遷移するボタンがあることを確認する
     expect(page).to have_content('ログイン')
     # ログインページへ遷移する
     visit new_user_session_path
     # 正しいユーザー情報を入力する
     fill_in 'メールアドレス', with: @user.email
     fill_in 'パスワード（6文字以上）', with: @user.password
     # ログインボタンを押す
     find('input[name="commit"]').click
     # スポット一覧ページへ遷移することを確認する
     expect(current_path).to eq(root_path)
  end
end