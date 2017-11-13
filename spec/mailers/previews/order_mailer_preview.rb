# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/quote_price
  def quote_price
    email = 'doanminhthuan274@gmail.com'
    html = '<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Excel To HTML using codebeautify.org</title></head><body><!DOCTYPE html><html><head><meta charset="UTF-8"><title>Excel To HTML using codebeautify.org</title></head><body><!DOCTYPE html><html><head><meta charset="UTF-8"><title>Excel To HTML using codebeautify.org</title></head><body><html><head><style>
            html, body {
              border: 1px solid white;
              height: 99%;
            }
            img {
              width: 190px;
              height: 80px;
              margin-bottom: 5px;
            }
            .margin-top {
              margin-top: 10px;
            }
            table {
              border
            }
          </style><link href="./assets/dist/css/bootstrap.min.css" rel="stylesheet"><link rel="stylesheet" href="./assets/font-awesome/css/font-awesome.css"><link rel="stylesheet" href="./assets/dist/css/ace.min.css"></head><body><div class="widget-box transparent"><div class="widget-header widget-header-large"><h6 class="widget-title grey lighter"><img src="../../assets/img/logo.jpg" alt=""></h6><div class="widget-toolbar no-border invoice-info"><h4><strong>CÔNG TY TNHH MTV VIỆT KHẢI HƯNG </strong></h4><h5><em>Nhà phân phối vật tư thiết bị điện, nước, vật liệu hoàn thiện khác.</em></h5></div></div><div class="widget-header widget-header-large margin-top"><span>Đ/c: Số 19 Nguyễn Công Trứ - Đông Hà - Quảng Trị &nbsp; &nbsp; &nbsp;</span><span>   Email: vietkhaihung@gmail.com</span><br><span>ĐT: 0944552333 - 02333588333; Fax: 02333. 852890</span></div><div class="widget-body"><div class="widget-main"><div class="space-6"></div><div class="row"><h4 class="text-center"><strong>BÁO GIÁ SẢN PHẨM</strong></h4></div><div class="row"><h5>Kính gửi: Quý khách hàng</h5></div></div></div></div><div class="widget-body" id="print-section"><div class="widget-main"><table id="simple-table" class="table table-striped table-bordered table-hover dataTable no-footer" cellspacing="0" width="100%"><thead><tr><th>Mã sản phẩm</th><th>Tên</th><th class="right-align">Số lượng</th><th class="right-align">Giá hãng</th><th class="right-align">Chiết khấu</th><th class="right-align">Giá bán</th><th>Thành tiền</th></tr></thead><tbody><tr><td>SON-2201</td><td>Sony Smartwatch 2</td><td class="right-align"> 4 </td><td class="right-align"> 134 </td><td class="right-align"> 0 % </td><td class="right-align">
                  134
                </td><td class="right-align"> 536.00
                </td></tr><tr><td>WIF-1056</td><td>iPad Pro</td><td class="right-align"> 1 </td><td class="right-align"> 700 </td><td class="right-align"> 20 % </td><td class="right-align">
                  560
                </td><td class="right-align"> 560.00
                </td></tr><tr><td colspan="6"><h6 class="text-center"><strong> Tổng cộng </strong></h6></td><td id="total" colspan="2"><h5>1096.00</h5></td></tr></tbody></table></div></div></body></html></body></html></body></html></body></html>'
    OrderMailer.quote_price(email, html)
  end

end
