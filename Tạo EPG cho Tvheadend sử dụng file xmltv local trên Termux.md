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

✔ Bước 2 — Khai báo grabber để TVH nhận diện

TVHeadend chỉ hiển thị các grabber có file .desc trong ~/.xmltv

Tạo:

mkdir -p ~/.xmltv
nano ~/.xmltv/tv_grab_tempest.desc

Dán vào:

tv_grab_tempest
Tempest XMLTV Importer
baseline
Lưu lại.


---

✔ Bước 3 — Khởi động lại TVHeadend với đúng thư mục cấu hình

tvheadend -c ~/tvhdata


---

Bước 4 - Sửa lại tên Module

Sẽ có trường hợp Tvheadend lấy phần đầu file xml làm tên module, để sửa nó thực hiện như sau:
Sửa:
nano tvhdata/epggrab/config
và sửa lại như này
"modules": {
                "/data/data/com.termux/files/usr/bin/tv_grab_tempest": {
                        "class": "epggrab_mod_int_xmltv",
                        "dn_chnum": 0,
                        "scrape_extra": false,
                        "scrape_onto_desc": false,
                        "use_category_not_genre": false,
                        "name": "NHKSchedule",
                        "type": "Internal",
                        "enabled": true,
                        "priority": 3
                },
                lưu lại:Ctrl x y Enter

✔ Bước 5 — Vào TVH WebUI

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
