# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/quote_price
  def quote_price
    email = 'doanminhthuan274@gmail.com'
    html = '<h1>Thuan ROR</h1>'
    OrderMailer.quote_price(email, html)
  end

end
