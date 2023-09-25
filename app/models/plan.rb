class Plan < ApplicationRecord
    validates :title, presence: true,length: { maximum: 20 }
    validates :start_day, presence: true
    validates :finish_day, presence: true
    validates :memo, length: { maximum: 500 }
    validate :after_start_day?

    def after_start_day?
        return unless start_day.present? && finish_day.present? 
        # 開始日、終了日どちらかがnilなら実行しない。値がnilで比較できなくてエラーになるから

        if start_day > finish_day
            errors.add(:finish_day, "は開始日以降の日付を選択してください")
        end
    end
end
