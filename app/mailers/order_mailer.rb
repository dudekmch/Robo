class OrderMailer < ApplicationMailer
  def order_confirmation(order)
    @order = order
    mail to: order.user.email, subject: "Dziękujemy za zamówienie nr #{order.id}"
  end

  def order_in_progress(order)
    @order = order
    mail to: order.user.email, subject: "Zamówienie nr #{order.id} w realizacj"
  end

  def order_shipped(order)
    @order = order
    mail to: order.user.email, subject: "Zamówienie nr #{order.id} wysłane"
  end

  def order_cancelled(order)
    @order = order
    mail to: order.user.email, subject: "Zamówienie nr #{order.id} anulowane"
  end
end
