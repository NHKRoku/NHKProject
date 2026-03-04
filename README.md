- NOTE FOR WEB TUNER HTML -

1.URL's Form
. Single Tuners:base?m3u8=LINK_STREAM&tvgid=ID_KENH&logo=LINK_LOGO&xmltv=LINK_EPG
  EG:?m3u8=http://192.168.1.10:8000/nhk.m3u8&tvgid=nhk.jp&logo=https://www.nhk.jp/favicon.ico&xmltv=http://192.168.1.10/epg.xml

. The Remaining Versions:?m3u=Path/to/m3u/file
  EG:?m3u=/playlist.m3u or ?m3u=http://192.168.1.10:8000/playlist.m3u

2. Supported Stream Types
. Single Tuner, V1, V2:
  - HLS (.m3u8)
. V1.5, V2.5:
  - MPEG-TS (.ts)

3. Requirements for V1.5 and V2.5

3.1. Stream must be in MPEG-TS (.ts) format.

3.2. To fully use ARIB-B24 subtitle function:
  - Source must contain ARIB caption stream
  - Stream type must be 0x0006 (private data)
EG For BS Animax - BS236
  Program 1
    Metadata:                                                                                         
    service_name    : Service01                                                                                                                             
    service_provider: FFmpeg                                                                                                                            
  Stream #0:0[0x100]: Data: bin_data ([6][0][0][0] / 0x0006), start 0.500000
  Stream #0:1[0x101]: Video: h264 (High) ([27][0][0][0] / 0x001B), yuv420p(tv, bt709, progressive), 960x720 [SAR 4:3 DAR 16:9], 29.97 fps, 29.97 tbr, 90k tbn, start 1.234067                                                                                                                                     Stream #0:2[0x102]: Audio: aac (LC) ([15][0][0][0] / 0x000F), 48000 Hz, stereo, fltp, 194 kb/s, start 0.500000
  Stream #0:3[0x103]: Subtitle: arib_caption (Profile A) ([6][0][0][0] / 0x0006), start 0.987533                                                          
  Stream #0:4[0x104]: Data: bin_data ([6][0][0][0] / 0x0006)

- This format can be generated using EPGStation profile: "M2TS-LL" -

  - ウェブチューナー HTML に関する注意事項 -

1. URLの形式
. シングルチューナー: base?m3u8=ストリームURL&tvgid=チャンネルID&logo=ロゴURL&xmltv=EPG_URL
  例: ?m3u8=http://192.168.1.10:8000/nhk.m3u8&tvgid=nhk.jp&logo=https://www.nhk.jp/favicon.ico&xmltv=http://192.168.1.10/epg.xml

. その他のバージョン: ?m3u=m3uファイルのパス
  例: ?m3u=/playlist.m3u または ?m3u=http://192.168.1.10:8000/playlist.m3u

2. 対応しているストリーム形式
. シングルチューナー、V1、V2:
   - HLS (.m3u8)
. V1.5、V2.5:
   - MPEG-TS (.ts)

3. V1.5 および V2.5 の要件

3.1. ストリームは MPEG-TS (.ts) 形式である必要があります。

3.2. ARIB-B24 字幕機能を完全に利用するには:
   - ソースに ARIB キャプションストリームが含まれている必要があります
   - ストリーム形式は 0x0006 (プライベートデータ) である必要があります
例: BSアニマックス - BS236 の場合
  Program 1
    Metadata:                                                                                         
    service_name    : Service01                                                                                                                             
    service_provider: FFmpeg                                                                                                                            
  Stream #0:0[0x100]: Data: bin_data ([6][0][0][0] / 0x0006), start 0.500000
  Stream #0:1[0x101]: Video: h264 (High) ([27][0][0][0] / 0x001B), yuv420p(tv, bt709, progressive), 960x720 [SAR 4:3 DAR 16:9], 29.97 fps, 29.97 tbr, 90k tbn, start 1.234067                                                                                                                                     Stream #0:2[0x102]: Audio: aac (LC) ([15][0][0][0] / 0x000F), 48000 Hz, stereo, fltp, 194 kb/s, start 0.500000
  Stream #0:3[0x103]: Subtitle: arib_caption (Profile A) ([6][0][0][0] / 0x0006), start 0.987533                                                          
  Stream #0:4[0x104]: Data: bin_data ([6][0][0][0] / 0x0006)

- この形式は、EPGStationのプロファイル「M2TS-LL」を使用して生成できます。
