class Credit < ApplicationRecord
  before_create :gg
  validate :date
  validates :sum, numericality: { message: "Сумма должна быть числом" }
  validates :percent, numericality: { message: "Процент должен быть числом" }

  def gg
    self.active = true
  end

  def date
    if self.end_date < self.start_date
      self.errors.add(:start_date, "Дата начала позже даты конца")
    end
  end
end

