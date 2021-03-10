class PagesController < ApplicationController
  def about
    @text = 'Банковский день успешно закрыт!'
    @deposit = Deposit.all
    @credit = Credit.where(active: true)
    # @deposit.percentSum = 0

    @deposit.each do |deposit|
      sum = (deposit.sumOfDeposit + deposit.percentSum) * (deposit.percent.to_f / 36500.0)
      sum += deposit.percentSum
      deposit.update(:percentSum => sum)
    end

    @credit.each do |deposit|
      if deposit.credit_type == "Аннуитетный"
        # sum = (deposit.sum + deposit.percent_sum) * (deposit.percent.to_f ** (1/deposit.end_date.month - deposit.start_date.month).to_i)
        p deposit.percent
        p ((1+deposit.percent)**(deposit.end_date.month - deposit.start_date.month))
        coef = (deposit.percent * (1+deposit.percent)**(deposit.end_date.month - deposit.start_date.month))/(((1+deposit.percent)**(deposit.end_date.month - deposit.start_date.month)))
        sum = ((deposit.sum + deposit.percent_sum) * coef/ 36500.0)
        sum += deposit.percent_sum
        deposit.update(:percent_sum => sum)
      else
        sum = (deposit.sum) * (deposit.percent.to_f / 36500.0)
        sum += deposit.percent_sum
        deposit.update(:percent_sum => sum)
      end

    end
  end
end
