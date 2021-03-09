class User < ApplicationRecord
  has_many :credits

  validates :surname, format: { with: /[А-Яа-я]/,
    message: "Введите фамилию" }, length: {minimum: 2, too_short: "Слишком короткая фамилия, введите занаво"}
  validates :name, format: { with: /[А-Яа-я]/,
    message: "Введите имя" }, length: {minimum: 2, too_short: "Слишком короткое имя, введите занаво"}
  validates :secondname, format: { with: /[А-Яа-я]/,
    message: "Введите отчество" }, length: {minimum: 2, too_short: "Слишком короткое отчество, введите занаво"}
  validates :borndate, presence: { message: "Введите дату рождения" }
  validates :sex, presence: { message: "Выберите ваш пол" }
  validates :passportserial, presence: { message: "Введите серию пасспорта" }
  validates :passportnum, presence: { message: "Введите номер пасспорта" }, uniqueness: { message: "Номер пасспорта должен быть уникальным" }
  validates :issuebody, presence: { message: "Введите орган выдачи пасспорта" }
  validates :dateissue, presence: { message: "Введите дату выдачи пасспорта" }
  validates :identnum, presence: { message: "Введите идентификационный номер" }, length: {is: 14, wrong_length: "Идентификационный номер состоит из 14 символов"}, uniqueness: { message: "Идентификационный номер должен быть уникальным" }
  validates :bornissue, presence: { message: "Введите место рождения" }
  validates :factcity, presence: { message: "Введите фактический город проживания" }
  validates :factadress, presence: { message: "Введите фактический адрес проживания" }
  validates :homephone, length: { is: 7, wrong_length: "Домашний телефон состоит из 7 цифр"}
  validates :phone, length: { minimum: 7, maximum: 13, too_short: "Слишком короткий мобильный телефон", too_long: "Слишком длинный мобильный телефон"}
  # validates :email, acceptance: { true, message: "" }
  validates :regaddress, presence: { message: "Введите адрес регистрации" }
  validates :materialstatus, presence: { message: "Введите семейное положение" }
  validates :citizenship, presence: { message: "Введите гражданство" }
  validates :disability, presence: { message: "Введите группу инвалидности, или ее отсутствие" }
  # validates :pensioner, presence: { true, message: "Введите" }
  validates :monthincome, numericality: { message: "Введите доход в цифрах" }
end
# <div class="alert alert-danger">Дата выдачи пасспорта не может быть меньше чем дата рождения!</div>
