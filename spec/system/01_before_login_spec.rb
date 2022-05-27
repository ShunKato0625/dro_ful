require 'rails_helper'

describe '[STEP1] ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
    end
  end

  describe 'アバウト画面のテスト' do
    before do
      visit '/homes/about'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/homes/about'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしていない場合' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it '左上にDro-Fulロゴリンクが表示される' do
        home_link = find_all('a')[0].native.inner_text
        expect(home_link).to eq ""
      end
      it '右上にAboutリンクが表示される: 左から1番目のリンクが「About」である' do
        about_link = find_all('a')[1].native.inner_text
        expect(about_link).to match(/About/)
      end
      it '右上に投稿一覧リンクが表示される: 左から2番目のリンクが「投稿一覧」である' do
        post_index_link = find_all('a')[2].native.inner_text
        expect(post_index_link).to match(/投稿一覧/)
      end
      it '右上に新規登録リンクが表示される: 左から3番目のリンクが「新規登録」である' do
        signup_link = find_all('a')[3].native.inner_text
        expect(signup_link).to match(/新規登録/)
      end
      it '右上にログインリンクが表示される: 左から4番目のリンクが「ログイン」である' do
        login_link = find_all('a')[4].native.inner_text
        expect(login_link).to match(/ログイン/)
      end
    end

    context 'リンクの内容を確認' do
      subject { current_path }

      it 'ロゴを押すと、トップ画面に遷移する' do
        home_link = find_all('a')[0].native.inner_text
        home_link = home_link.delete(' ')
        home_link.gsub!(/\n/, '')
        click_link home_link
        is_expected.to eq '/'
      end
      it 'Aboutを押すと、アバウト画面に遷移する' do
        about_link = find_all('a')[1].native.inner_text
        about_link = about_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link about_link
        is_expected.to eq '/homes/about'
      end
      it '投稿一覧を押すと、投稿一覧画面に遷移する' do
        post_index_link = find_all('a')[2].native.inner_text
        post_index_link = post_index_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link post_index_link, match: :first
        is_expected.to eq '/posts'
      end
      it '新規登録を押すと、ログイン画面に遷移する' do
        signup_link = find_all('a')[3].native.inner_text
        signup_link = signup_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link signup_link, match: :first
        is_expected.to eq '/customers/sign_up'
      end
      it 'ログインを押すと、ログイン画面に遷移する' do
        login_link = find_all('a')[4].native.inner_text
        login_link = login_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link login_link, match: :first
        is_expected.to eq '/customers/sign_in'
      end
    end
  end

  describe 'ユーザ新規登録のテスト' do
    before do
      visit new_customer_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/customers/sign_up'
      end
      it '「新規登録」と表示される' do
        expect(page).to have_content '新規登録'
      end
      it '苗字フォームが表示される' do
        expect(page).to have_field 'customer[last_name]'
      end
      it '名前フォームが表示される' do
        expect(page).to have_field 'customer[first_name]'
      end
      it '苗字（カナ）フォームが表示される' do
        expect(page).to have_field 'customer[last_name_kana]'
      end
      it '名前（カナ）フォームが表示される' do
        expect(page).to have_field 'customer[first_name_kana]'
      end
      it 'ニックネームフォームが表示される' do
        expect(page).to have_field 'customer[nick_name]'
      end
      it 'メールアドレスフォームが表示される' do
        expect(page).to have_field 'customer[email]'
      end
      it 'パスワード (6文字以上)フォームが表示される' do
        expect(page).to have_field 'customer[password]'
      end
      it 'パスワード（確認用）フォームが表示される' do
        expect(page).to have_field 'customer[password_confirmation]'
      end
      it '新規登録ボタンが表示される' do
        expect(page).to have_button '新規登録'
      end
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'customer[last_name]', with: Faker::Lorem.characters(number: 2)
        fill_in 'customer[first_name]', with: Faker::Lorem.characters(number: 2)
        fill_in 'customer[last_name_kana]', with: Faker::Lorem.characters(number: 4)
        fill_in 'customer[first_name_kana]', with: Faker::Lorem.characters(number: 4)
        fill_in 'customer[nick_name]', with: Faker::Lorem.characters(number: 3)
        fill_in 'customer[email]', with: Faker::Internet.email
        fill_in 'customer[password]', with: 'password'
        fill_in 'customer[password_confirmation]', with: 'password'
      end

      it '正しく新規登録される' do
        expect { click_button '新規登録' }.to change(Customer.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、新規登録できたユーザの詳細画面になっている' do
        click_button '新規登録'
        expect(current_path).to eq '/customers/' + Customer.last.id.to_s + '/my_page'
      end
    end
  end

  describe 'ユーザログイン' do
    let(:customer) { create(:customer) }

    before do
      visit new_customer_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/customers/sign_in'
      end
      it '「ログイン」と表示される' do
        expect(page).to have_content 'ログイン'
      end
      it 'メールアドレスフォームが表示される' do
        expect(page).to have_field 'customer[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'customer[password]'
      end
      it 'ログインボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end
      it 'ニックネームフォームは表示されない' do
        expect(page).not_to have_field 'customer[nick_name]'
      end
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'customer[email]', with: customer.email
        fill_in 'customer[password]', with: customer.password
        click_button 'ログイン'
      end

      it 'ログイン後のリダイレクト先が、トップ画面になっている（ヘッダー変更される）' do
        expect(current_path).to eq '/'
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'customer[email]', with: ''
        fill_in 'customer[password]', with: ''
        click_button 'ログイン'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/customers/sign_in'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    let(:customer) { create(:customer) }

    before do
      visit new_customer_session_path
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[password]', with: customer.password
      click_button 'ログイン'
    end

    context 'ヘッダーの表示を確認' do
      it '左上にDro-Fulロゴリンクが表示される' do
        home_link = find_all('a')[0].native.inner_text
        expect(home_link).to eq ""
      end
      it '右上にマイページリンクが表示される: 左から1番目のリンクが「マイページ」である' do
        my_page_link = find_all('a')[1].native.inner_text
        expect(my_page_link).to match(/マイページ/)
      end
      it '右上に会員一覧リンクが表示される: 左から2番目のリンクが「会員一覧」である' do
        customer_index_link = find_all('a')[2].native.inner_text
        expect(customer_index_link).to match(/会員一覧/)
      end
      it '右上に投稿一覧リンクが表示される: 左から3番目のリンクが「投稿一覧」である' do
        post_index_link = find_all('a')[3].native.inner_text
        expect(post_index_link).to match(/投稿一覧/)
      end
      it '右上に投稿するリンクが表示される: 左から4番目のリンクが「投稿する」である' do
        post_new_link = find_all('a')[4].native.inner_text
        expect(post_new_link).to match(/投稿する/)
      end
      it '右上に投稿一覧リンクが表示される: 左から5番目のリンクが「投稿一覧」である' do
        logout_link = find_all('a')[5].native.inner_text
        expect(logout_link).to match(/ログアウト/)
      end
    end
  end

  describe 'ユーザログアウトのテスト' do
    let(:customer) { create(:customer) }

    before do
      visit new_customer_session_path
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[password]', with: customer.password
      click_button 'ログイン'
      logout_link = find_all('a')[5].native.inner_text
      logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
      click_link logout_link
    end

    context 'ログアウト機能のテスト' do
      it '正しくログアウトできている: ログアウト後のリダイレクト先においてAbout画面へのリンクが存在する' do
        expect(page).to have_link '', href: '/homes/about'
      end
      it 'ログアウト後のリダイレクト先が、トップになっている（ヘッダー変更される）' do
        expect(current_path).to eq '/'
      end
    end
  end
end