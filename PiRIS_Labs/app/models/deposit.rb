class Deposit < ApplicationRecord
  validates :sumOfDeposit, numericality: { message: "Сумма должна быть числом" }
  validates :percent, numericality: { only_integer: true, less_than_or_equal_to: 25, message: "Процент по депозиту не может быть более двадцати пяти процентов" }
end
