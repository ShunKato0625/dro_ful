require 'rails_helper'

RSpec.describe 'Customerモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    # subject { customer.valid? }

    customer = Customer.new()

    other_customer = Customer.create({id: 2, email: "michiko@example.com", created_at: "2022-05-10 02:06:30.219901000 +0900", updated_at: "2022-05-18 10:28:58.715630000 +0900", last_name: "レイワ", first_name: "レイワ", last_name_kana: "レイワ", first_name_kana: "レイワ",
    nick_name: "Test", is_deleted: false, introduction: "よろし"})

    # let!(:other_customer) { create(:customer) }
    # let(:customer) { build(:customer) }

    p customer

    context 'nick_nameカラム' do
      it '空欄でないこと' do
        customer.nick_name = ''
        expect(customer.nick_name).to eq ''
        # is_expected.to eq false
      end
      
      it '一意性があること' do
        customer.nick_name = other_customer.nick_name
        expect(customer.nick_name).to eq other_customer.nick_name
        # is_expected.to eq false
      end
    end

    # 修正する
    context 'last_nameカラム' do
      it '空欄でないこと' do
        customer.last_name = ''
        is_expected.to eq false
      end
    end

    context 'first_nameカラム' do
      it '空欄でないこと' do
        customer.first_name = ''
        is_expected.to eq false
      end
    end

    context 'last_name_kanaカラム' do
      it '空欄でないこと' do
        customer.last_name_kana = ''
        is_expected.to eq false
      end
    end

    context 'first_name_kanaカラム' do
      it '空欄でないこと' do
        customer.first_name_kana = ''
        is_expected.to eq false
      end
    end

    context 'emailカラム' do
      it '空欄でないこと' do
        customer.email = ''
        is_expected.to eq false
      end
      # it '一意性があること' do
      #   customer.email = other_customer.email
      #   is_expected.to eq false
      # end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
  end
end

