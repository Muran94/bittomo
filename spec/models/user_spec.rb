# == Schema Information
#
# Table name: users
#
#  id                      :bigint           not null, primary key
#  email                   :string           default(""), not null
#  encrypted_password      :string           default(""), not null
#  reset_password_token    :string
#  reset_password_sent_at  :datetime
#  remember_created_at     :datetime
#  activity_prefecture_ids :string           default([]), is an Array
#  avatar                  :string
#  birthday                :date
#  gender                  :integer
#  name                    :string
#  introduction            :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  # コールバック
  describe "Callbacks" do
    describe "after_create_commit" do
      context "create_privacy_settingメソッドが実行されること" do
        let(:user) { build(:user) }

        before { allow_any_instance_of(User).to receive(:create_privacy_setting) }

        it do
          user.save
          expect(user).to have_received(:create_privacy_setting).once
        end
      end

      context "create_notification_settingメソッドが実行されること" do
        let(:user) { build(:user) }

        before { allow_any_instance_of(User).to receive(:create_notification_setting) }

        it do
          user.save
          expect(user).to have_received(:create_notification_setting).once
        end
      end

      context "create_article_notification_conditionメソッドが実行されること" do
        let(:user) { build(:user) }

        before { allow_any_instance_of(User).to receive(:create_article_notification_condition) }

        it do
          user.save
          expect(user).to have_received(:create_article_notification_condition).once
        end
      end
    end
  end

  # 関連付け
  describe "Association" do
    describe "has_one :privacy_setting" do
      context "Userのレコードが削除された時に、それに紐づくPrivacySettingも削除されること" do
        let!(:user) { create(:user) }

        it do
          expect {
            user.destroy
          }.to change(PrivacySetting, :count).by(-1)
        end
      end
    end

    describe "has_one :notification_setting" do
      context "Userのレコードが削除された時に、それに紐づくNotificationSettingも削除されること" do
        let!(:user) { create(:user) }

        it do
          expect {
            user.destroy
          }.to change(NotificationSetting, :count).by(-1)
        end
      end
    end

    describe "has_one :article_notification_condition" do
      context "Userのレコードが削除された時に、それに紐づくArticleNotificationConditionも削除されること" do
        let!(:user) { create(:user) }

        it do
          expect {
            user.destroy
          }.to change(ArticleNotificationCondition, :count).by(-1)
        end
      end
    end

    describe "has_many :articles" do
      context "Userのレコードが削除された時に、それに紐づくArticleNotificationConditionも削除されること" do
        let!(:user) { create(:user) }
        let(:article_amount) { 3 }
        let!(:articles) { create_list(:article, article_amount, user: user) }

        it do
          expect {
            user.destroy
          }.to change(Article, :count).by(-article_amount)
        end
      end
    end

    describe "has_many :conversations" do
      context "Userのレコードが削除された時に、それに紐づくConversationも削除されること" do
        let!(:user) { create(:user) }
        let(:conversation_amount) { 2 }
        let!(:conversations) { create_list(:conversation, conversation_amount, sender: user) }

        it do
          expect {
            user.destroy
          }.to change(Conversation, :count).by(-conversation_amount)
        end
      end
    end
  end

  # バリデーション
  describe "Validations" do
    describe "name" do
      context "0字（nil、空文字）の時" do
        it "バリデーションに引っかかること" do
          aggregate_failures do
            expect(build_stubbed(:user, name: nil)).to be_invalid
            expect(build_stubbed(:user, name: "")).to be_invalid
          end
        end
      end

      context "1〜30字の時" do
        it "バリデーションに引っかからないこと" do
          aggregate_failures do
            expect(build_stubbed(:user, name: "a")).to be_valid
            expect(build_stubbed(:user, name: "a" * User::MAXIMUM_NAME_LENGTH)).to be_valid
          end
        end
      end

      context "31字の時" do
        it "バリデーションに引っかかること" do
          expect(build_stubbed(:user, name: "a" * (User::MAXIMUM_NAME_LENGTH + 1))).to be_invalid
        end
      end
    end

    describe "introduction" do
      context "1〜1,000字の時" do
        it "バリデーションに引っかからないこと" do
          aggregate_failures do
            expect(build_stubbed(:user, introduction: "a")).to be_valid
            expect(build_stubbed(:user, introduction: "a" * User::MAXIMUM_INTRODUCTION_LENGTH)).to be_valid
          end
        end
      end

      context "1,000字の時" do
        it "バリデーションに引っかかること" do
          expect(build_stubbed(:user, introduction: "a" * (User::MAXIMUM_INTRODUCTION_LENGTH + 1))).to be_invalid
        end
      end
    end

    describe "birthday" do
      context "存在する日付を指定した場合" do
        it "バリデーションに引っかからないこと" do
          expect(build_stubbed(:user, birthday: '1994-01-13')).to be_valid
        end
      end

      context "存在しない日付を指定したり、未入力であった場合" do
        it "バリデーションに引っかかること" do
          aggregate_failures do
            expect(build_stubbed(:user, birthday: '1994-02-31')).to be_invalid
            expect(build_stubbed(:user, birthday: nil)).to be_invalid
            expect(build_stubbed(:user, birthday: '')).to be_invalid
          end
        end
      end
    end

    describe "gender" do
      context "male,female,0,1のどちらかを渡した場合" do
        it "バリデーションに引っかからないこと" do
          aggregate_failures do
            expect(build_stubbed(:user, gender: :male)).to be_valid
            expect(build_stubbed(:user, gender: :female)).to be_valid
            expect(build_stubbed(:user, gender: 0)).to be_valid
            expect(build_stubbed(:user, gender: 1)).to be_valid
          end
        end
      end

      context "male, female, 0, 1のどれでもない値を渡した場合" do
        it "ArgumentErrorをraiseすること" do
          aggregate_failures do
            expect{ build_stubbed(:user, gender: :something) }.to raise_error(ArgumentError)
            expect{ build_stubbed(:user, gender: 3) }.to raise_error(ArgumentError)
          end
        end
      end
    end

    describe "activity_prefecture_ids" do
      context "正しい都道府県コードを、３つまで選択した時" do
        it "バリデーションに引っかからないこと" do
          aggregate_failures do
            expect(build_stubbed(:user, activity_prefecture_ids: [1])).to be_valid
            expect(build_stubbed(:user, activity_prefecture_ids: [12, 13])).to be_valid
            expect(build_stubbed(:user, activity_prefecture_ids: [11, 12, 13])).to be_valid
          end
        end
      end

      context "存在しない都道府県コードが選択された時" do
        it "バリデーションに引っかかること" do
          expect(build_stubbed(:user, activity_prefecture_ids: [0])).to be_invalid
        end
      end

      context "４つ以上選択した時" do
        it "バリデーションに引っかかること" do
          expect(build_stubbed(:user, activity_prefecture_ids: [1, 2, 3, 4])).to be_invalid
        end
      end
    end
  end

  # スコープ
  describe "Scopes" do
  end

  # クラスメソッド
  describe "Class Methods" do
  end

  # インスタンスメソッド
  describe "Instance Methods" do
    describe "activity_prefecture_names_ja" do
      context "都道府県が設定されていない場合（実装上ありえないが）" do
        it "空文字を返す" do
          user = build(:user, activity_prefecture_ids: [])
          user.save(validate: false)
          expect(user.activity_prefecture_names_ja).to eq ""
        end
      end

      context "都道府県が設定されている場合" do
        it "日本語に変換し、「、」で繋げたものを返す" do
          aggregate_failures do
            expect(build_stubbed(:user, activity_prefecture_ids: [14, 13]).activity_prefecture_names_ja).to eq "神奈川県、東京都"
            expect(build_stubbed(:user, activity_prefecture_ids: [13]).activity_prefecture_names_ja).to eq "東京都"
          end
        end
      end
    end

    describe "age" do
      context "birthdayが未入力状態の時（実装上ありえないが）" do
        it "「年齢不明」と返すこと" do
          user = build(:user, birthday: nil)
          user.save(validate: false)
          expect(user.age).to eq "年齢不明"
        end
      end

      context "birthdayから正確な年齢を逆算できること" do
        it "正しい年齢が返ってくること" do
          aggregate_failures do
            expect(build(:user, birthday: (20.years.ago - 1.day)).age).to eq 20
            expect(build(:user, birthday: 20.years.ago).age).to eq 20
            expect(build(:user, birthday: (20.years.ago + 1.day)).age).to eq 19
          end
        end
      end
    end

    describe "owner?(current_user)" do
      context "引数が渡って来なかった場合" do
        it "falseが返ってくること" do
          expect(build_stubbed(:user).owner?(nil)).to be_falsy
        end
      end

      context "引数から渡ってきたユーザーオブジェクトと、インスタンスオブジェクトが違う場合" do
        it "trueが返ってくること" do
          user = create(:user)
          expect(user.owner?(user)).to be_truthy
        end
      end

      context "引数から渡ってきたユーザーオブジェクトと、インスタンスオブジェクトが同じ場合" do
        it "falseが返ってくること" do
          user = create(:user)
          other_user = create(:user)
          expect(user.owner?(other_user)).to be_falsy
        end
      end
    end
  end

  # プライベートメソッド
  describe "Private Methods" do
  end
end
