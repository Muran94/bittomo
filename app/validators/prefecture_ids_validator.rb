class PrefectureIdsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    available_prefecture_codes = JpPrefecture::Prefecture.all.map(&:code)

    # 不正な都道府県コードが含まれていないかチェック
    value.each do |v|
      if available_prefecture_codes.exclude?(v)
        record.errors[attribute] << "存在しない都道府県が選択されています。"
        break
      end
    end

    # 登録している都道府県の数が、３つ以内かチェック
    if value.count > 3
      record.errors[attribute] << "選択できる都道府県は、最大で３つまでとなります。"
    end
  end
end
