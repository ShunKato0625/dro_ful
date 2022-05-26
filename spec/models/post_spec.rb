require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post.valid? }

    let(:customer) { create(:customer) }
    let!(:post) { build(:post, customer_id: customer.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        post.title = ''
        is_expected.to eq false
      end
    end

    context 'prefecture_idカラム' do
      it '空欄でないこと' do
        post.prefecture_id = ''
        is_expected.to eq false
      end
    end

    context 'accessカラム' do
      it '空欄でないこと' do
        post.access = ''
        is_expected.to eq false
      end
    end

    context 'authorizationカラム' do
      it '空欄でないこと' do
        post.authorization = ''
        is_expected.to eq false
      end
    end

    context 'drone_typeカラム' do
      it '空欄でないこと' do
        post.drone_type = ''
        is_expected.to eq false
      end
    end

    context 'remarksカラム' do
      it '空欄でないこと' do
        post.remarks = ''
        is_expected.to eq false
      end
    end

    context 'rateカラム' do
      it '空欄でないこと' do
        post.rate = ''
        is_expected.to eq false
      end
    end

    context 'shooting_dateカラム' do
      it '空欄でないこと' do
        post.shooting_date = ''
        is_expected.to eq false
      end
    end

    context 'requestカラム' do
      it '空欄でないこと' do
        post.request = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end
end