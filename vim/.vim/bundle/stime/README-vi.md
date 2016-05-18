<meta charset="utf-8"><font face="Times New Roman">
<font size="5"><center>**Bản thuyết minh phần mềm sáng tạo**</center></font>
<font size="4">
**I. Giới thiệu chung**

1. Họ và tên: Nguyễn Gia Phong

2. Ngày tháng năm sinh: 26/05/2000

3. Tên sản phẩm: Stime - Bộ gõ dạng bảng cho vim

4. Tôi tán thành thể lệ Hội thi và xin đăng ký phần mềm

    Bảng: D1 ☐ D2 ☐ D3 ☑

5. Giới thiệu chương trình gồm các thông tin:

    * Ngôn ngữ lập trình: Vim scripts

    * Cấu hình cài đặt: Do Vim hoạt động trên hầu hết các kiến trúc máy tính
      (computer architecture) và hệ điều hành nên Stime - một plugin của Vim -
      cũng vậy.

    * Dung lượng chương trình: 1.6 MB

    * Phần mềm được lưu trữ trên đĩa:

        CDROM   ☑

        Tổng cộng: 1 đĩa

    * Các yêu cầu khác cần thiết để sử dụng PMST: Máy tính cần có cài Vim:
        * Với Windows: cài GVim từ trang chủ
          [vim.org](http://www.vim.org/download.php#pc) (gói PMST sẽ kèm theo
          phần cài đặt GVim cho Windows)
        * Với OS X: OS X đi kèm với Vim
        * Với GNU/Linux hoặc các BSD: cài bằng phần mềm quản lí gói (package
          manager, ví dụ như apt, yum, pacman, ...).
        Ngoài ra có thể cần font Mono (Droid Sans Mono, Noto Mono, ...) hỗ trợ
        ngôn ngữ cần gõ.

    * Các nguồn phần mềm được sử dụng:
        * Các kiểu gõ *cns11643*, *latex*, *translit*, *viqr*, *compose*,
          *rusle*, *translit-ua*, *ipa-x-sampa*, *rustrad*, *thai*, *yawerty*
          được lấy từ
          [github.com/moebiuscurve/ibus-table-others](https://github.com/moebiuscurve/ibus-table-others)
        * Các kiểu gõ *cyrillic*, *diacritics*, *greek*, *turkish* được lấy từ
          [github.com/muflax-scholars/saneo](https://github.com/muflax-scholars/saneo)

    * Tóm tắt PMST: Stime (Simple Table Input Method Engine) là một bộ gõ dạng
      bảng tương tự như ibus-table cho Vim được viết hoàn toàn trên Vim scripts.
      Với khả năng đọc bảng quy tắc gõ dành cho ibus-table, Stime có thể hỗ trợ
      gõ khá nhiều ngôn ngữ như tiếng Việt (kiểu gõ Telex, VNI, VIQR), tiếng
      Thái, tiếng Nga, LaTex, ... Stime được phát triển do vấn đề tương thích
      giữa Vim và các bộ gõ tiếng Việt hiện hành (Unikey, ibus-unikey,
      ibus-bogo, ...).

**II. Nội dung thuyết minh**

Vim là một phần mềm chỉnh sửa văn bản giàu chức năng và thông dụng với các lập
trình viên và các nhà quản trị hệ thống. Theo
[vimregrex.com](http://www.vimregex.com/#whatisvim), chỉ tính riêng người dùng
GNU/Linux đã có trên 10 triệu người cài đặt Vim (số liệu năm 2002). Nhiều người
dùng Vim có nhu cầu gõ ngôn ngữ của họ, nhưng do bản tính của Vim sử dụng các
phím chữ cái trong Normal, Visual mode để thực hiện hầu hết các thao tác, nhiều
bộ gõ bên ngoài làm lỗi Vim. Stime được viết hoàn toàn trên Vim scripts (ngôn
ngữ được xây dựng trong Vim) để đảm bảo tương thích hoàn toàn.

Cài đặt Stime: Giải nén vào runtimepath của Vim (trong Vim chạy *:help
'runtimepath'* để biết thêm chi tiết). Trong vimrc (trong Vim chạy *:help vimrc*
để biết thêm chi tiết) thêm dòng:

*let g:stime_table = {fname} " trong đó {fname} là tên một kiểu gõ như 'vni'*

Hiện tại Stime hỗ trợ các kiểu gõ sau:

* cns11643
* compose
* cyrillic
* diacritics
* greek
* ipa-x-sampa
* latex
* rusle
* rustrad
* telex
* thai
* translit
* translit-ua
* turkish
* viqr
* vni
* yawerty

Để viết thêm kiểu gõ cho Stime, tham khảo tệp *template* trong thư mục *tables*.

Sử dụng Stime: Trong Vim, dùng tổ hợp phím *\<Leader\>\<Space\>* để bật/tắt bộ gõ;
*\<Leader\>s\<Space\>* để đọc lại kiểu gõ rồi bật/tắt bộ gõ (trong đó
*\<Space\>* là phím cách, còn về *\<Leader\>* đọc thêm ở *:help \<Leader\>*).

![Stime được sử dụng để viết bản thuyết minh này (trên Markdown và
HTML)](stime-in-use.png)

Tính ứng dụng và hướng phát triển:

* Do Vim có thể hoạt động trong môi trường dòng lệnh nên Stime mở ra khả năng gõ
  các ngôn ngữ này trong tty, điều chưa ứng dụng nào đạt được với tiếng Việt.
* Kiểu gõ telex được thêm ký tự thoát (escape character) giống như của vni (mặc
  định là '\\'). Ký tự thoát cho phép người dùng giữ nguyên ký tự sau, ví dụ như
  ta có thể gõ từ 'lawsuit' bằng 'la\\wsuit'.
* Để đơn giản hoá các bảng quy tắc gõ, các kiểu gõ tiếng Việt chỉ hỗ trợ gõ
  từng kí tự, ví dụ để gõ từ 'từng' bằng kiểu vni, ta bắt buộc phải gõ 'tu72ng'
  chứ không thể gõ khác. Đây là một bất tiện của bộ gõ này.
* Hiện tại, Stime chưa hỗ trợ nhiều kiểu gõ tiếng Trung Quốc theo bộ chữ. Vấn đề
  này vẫn đang được phát triển.

<p ALIGN=RIGHT>Hà Nội, ngày 14 tháng 4 năm 2016</p>
<p ALIGN=RIGHT>**Chữ kí của thí sinh**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><!--Yea I know I'm crazy-->
</font></meta>
