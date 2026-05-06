Bước 1 — Tạo grabber script tại $PREFIX/bin

nano $PREFIX/bin/tv_grab_tempest

Nội dung:

#!/data/data/com.termux/files/usr/bin/env bash

case "$1" in
  --description)
    echo "Tempest XMLTV Importer"
    exit 0
  ;;
  --capabilities)
    echo "baseline"
    exit 0
  ;;
esac

cat $HOME/epg/guide.xml

Phân quyền:

chmod +x $PREFIX/bin/tv_grab_tempest


---

✔ Bước 2 — Khởi động lại TVHeadend với đúng thư mục cấu hình

tvheadend -c ~/tvhdata


---

✔ Bước 3 — Vào TVH WebUI

Đi tới:

Configuration → Channels/EPG → EPG Grabber Modules

Bạn sẽ thấy:

> Internal: XMLTV: tv_grab_tempest



Bật nó lên → chạy Re-run internal EPG grabber.

EPG sẽ được load từ:

~/epg/guide.xml


---

🎉 Kết luận

Dù bạn dùng folder config khác với mặc định, chỉ cần:

✔ Grabber để trong $PREFIX/bin

✔ Mô tả (.desc) để trong ~/.xmltv

✔ Chạy TVH với -c ~/tvhdata

→ TVHeadend sẽ nhận đủ module và load được XMLTV.



Dưới đây là hướng dẫn tương đương trên Armbian / Linux TV Box (không phải Termux).
Vì Armbian chạy Linux chuẩn, nên không dùng $PREFIX mà dùng đường dẫn hệ thống /usr/bin.


---

✅ Bước 1 — Tạo grabber script

Tạo script:

sudo nano /usr/bin/tv_grab_tempest

Nội dung:

#!/usr/bin/env bash

case "$1" in
  --description)
    echo "Tempest XMLTV Importer"
    exit 0
  ;;
  --capabilities)
    echo "baseline"
    exit 0
  ;;
esac

cat $HOME/epg/guide.xml

Set quyền executable:

sudo chmod +x /usr/bin/tv_grab_tempest

👉 Ở Armbian, không cần $PREFIX.
Chỉ cần grabber nằm trong /usr/bin hoặc /usr/local/bin.


---

✅ Bước 2 — Chạy TVHeadend với folder config

🔥 Quan trọng

Nếu bạn dùng thư mục config riêng (ví dụ: chạy server local), chạy như sau:

tvheadend -c ~/tvhdata

Nếu bạn cài TVH từ repo Armbian, dịch vụ systemd sẽ dùng:

/home/hts/.hts/tvheadend

Hoặc:

/etc/tvheadend

👉 Khi đó không cần -c.


---

⛔️ Lưu ý khác biệt so với Termux

Termux user = bạn

Armbian TVH chạy dưới user hts


Nghĩa là file .xmltv phải nằm trong HOME của user chạy TVH.

✨ Nếu chạy tvheadend từ systemd:

HOME = /home/hts


=> Bạn phải đặt file:

/home/hts/.xmltv/tv_grab_tempest.desc

Và guide trong:

/home/hts/epg/guide.xml


---


✅ Bước 3 — Cấu hình trong WebUI

Đi tới:

Configuration → Channel/EPG → EPG Grabber Modules

Bạn sẽ thấy:

Internal: XMLTV: tv_grab_tempest

✔ Bật
✔ Save
✔ Re-run internal EPG grabber


---

📥 EPG sẽ được load từ

$HOME/epg/guide.xml

> HOME của user chạy TVH.




---

🎯 Kết luận cho Armbian / TV Box

✔ Grabber đặt ở:

/usr/bin/tv_grab_tempest

✔ File .desc đặt tại:

~/.xmltv/

✔ guide.xml đặt tại:

~/epg/guide.xml

✔ Nếu chạy TVH bằng systemd → mọi thứ nằm trong HOME user hts
