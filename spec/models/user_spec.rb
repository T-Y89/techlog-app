require 'rails_helper'

RSpec.describe User, type: :model do
  let(:nickname) { 'タイキ' }
  let(:email) { 'test@example.com' }
  let(:password) { '12345678' }
  let(:user) { User.new(nickname: nickname, email: email, password: password, password_confirmation: password) }

  describe ".first" do
    before do
      create(:user, nickname: nickname, email: email)
    end

    subject{described_class.first}
    it '事前に作成した通りのUserを返す' do
      expect(subject.nickname).to eq('タイキ')
      expect(subject.email).to eq('test@example.com')
    end
  end

  describe ".validation" do
    describe "nickanme" do
      describe "文字数の検証" do
        context "nicknameが20文字以下の場合" do
          let(:nickname) { 'あいうえおかきくけこさしすせそたちつてと' } # 20文字
          it '有効' do
            expect(user.valid?).to be(true)
          end
        end
        context "nicknameが20文字以上の場合" do
          let(:nickname) { 'あいうえおかきくけこさしすせそたちつてとあああ' }
          it '無効' do
            expect(user.valid?).to be(false)
            expect(user.errors[:nickname]).to include('is too long (maximum is 20 characters)')
          end
        end

      end
      describe "存在の検証" do
        context "空の場合" do
          let(:nickname) { '' }
          it 'falseを返す' do
            expect(user.valid?).to be(false)
          end
        end
        context "arubaai" do
          let(:nikname) { 'ああ' }
          it 'true' do
            expect(user.valid?).to be(true)
          end
        end
      end

    end
  end
end
