From: <doiggl@velocitynet.com.au>
Subject: How can I list files with accessible inodes [/dev/sdb]
Date: Fri, 19 Aug 2016 15:50:16 +1000
Message-ID: <0529de4b5b9d00bff54fbf8403d9a6f5@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hello,
Reiser4 on /dev/sdb
Can these  errors be fixed. 
No luck in the past.
I cannot access files which have ?????????? in ls listing or "No such file
or director"

How can I list files with accessible inodes
--Thanks Glenn


This a small portion of: ls

./extrarpms:
total 59335
drwxr-xr-x  2 root root       17 May 11  2011 .
drwxr-xr-x 46 root root       95 Aug 18  2011 ..
-rw-r-----  1 root root 11331411 May 11  2011
CodeAnalyst-2_13_2_0156-17.1.src.rpm
-rw-r-----  1 root root  1625670 May 11  2011
CodeAnalyst-2_13_2_0156-17.1.x86_64.rpm
-rw-r--r--  1 root root   308514 May 11  2011
CodeAnalyst-KernelModule-2_13_2_32-SuSELinuxEnterpriseServer11SP164bit-Public.bin.rpm
-rw-r-----  1 root root 17884452 May 11  2011
bugzilla-4.1.1-80.1.noarch.rpm
-rw-r-----  1 root root 17641073 May 11  2011 bugzilla-4.1.1-80.1.src.rpm

./phoronix/phoronix_files/adsense_728_90_data/ads_data:
ls: cannot access
./phoronix/phoronix_files/adsense_728_90_data/ads_data/abg-en-100c-ffffff.png:
No such file or directory
ls: cannot access
./phoronix/phoronix_files/adsense_728_90_data/ads_data/graphics.js: No such
file or directory
ls: cannot access
./phoronix/phoronix_files/adsense_728_90_data/ads_data/sma8.js: No such
file or directory
total 1
drwxr-xr-x 2 root root 5 Nov  3  2009 .
drwxr-xr-x 3 root root 6 Nov  3  2009 ..
?????????? ? ?    ?    ?            ? abg-en-100c-ffffff.png
?????????? ? ?    ?    ?            ? graphics.js
?????????? ? ?    ?    ?            ? sma8.js

./pictures:
total 122
drwxr-xr-x  2 root root      3 Mar 15  2011 .
drwxr-xr-x 46 root root     95 Aug 18  2011 ..
-rw-r--r--  1 root root 117162 Mar 15  2011 volcano.jpg

./plugins:
ls: cannot access ./plugins/linux-amd64plugins.html: No such file or
directory
total 6
drwxr-xr-x  3 root root  4 Sep 23  2009 .
drwxr-xr-x 46 root root 95 Aug 18  2011 ..
??????????  ? ?    ?     ?            ? linux-amd64plugins.html
drwxr-xr-x  2 root root 10 Sep 23  2009 linux-amd64plugins_files

./plugins/linux-amd64plugins_files:
ls: cannot access ./plugins/linux-amd64plugins_files/common.css: No such
file or directory
ls: cannot access ./plugins/linux-amd64plugins_files/divlayout.css: No
such file or directory
ls: cannot access ./plugins/linux-amd64plugins_files/faq.png: No such file
or directory
ls: cannot access ./plugins/linux-amd64plugins_files/firefox.png: No such
file or directory
ls: cannot access ./plugins/linux-amd64plugins_files/important.gif: No
such file or directory
ls: cannot access ./plugins/linux-amd64plugins_files/seamonkey.png: No
such file or directory
ls: cannot access ./plugins/linux-amd64plugins_files/valid-html401.png: No
such file or directory
ls: cannot access ./plugins/linux-amd64plugins_files/vcss.gif: No such
file or directory
total 1
drwxr-xr-x 2 root root 10 Sep 23  2009 .
drwxr-xr-x 3 root root  4 Sep 23  2009 ..
?????????? ? ?    ?     ?            ? common.css
?????????? ? ?    ?     ?            ? divlayout.css
?????????? ? ?    ?     ?            ? faq.png
?????????? ? ?    ?     ?            ? firefox.png
?????????? ? ?    ?     ?            ? important.gif
?????????? ? ?    ?     ?            ? seamonkey.png
?????????? ? ?    ?     ?            ? valid-html401.png
?????????? ? ?    ?     ?            ? vcss.gif

./rpm-description:
ls: cannot access ./rpm-description/fail2ban-0.8.3-3.2.x86_64.rpm.html: No
such file or directory
total 7
drwxr-xr-x  3 root root  4 Jan 25  2010 .
drwxr-xr-x 46 root root 95 Aug 18  2011 ..
??????????  ? ?    ?     ?            ? fail2ban-0.8.3-3.2.x86_64.rpm.html
drwxr-xr-x  3 root root 16 Jan 25  2010
fail2ban-0.8.3-3.2.x86_64.rpm_files


/media/disk # ls -la

# fdisk -l

Disk /dev/sdb: 2000.4 GB, 2000398934016 bytes, 3907029168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes

cd / 
# mount  /dev/sdb /media/disk

# df -h 
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda2        12G  9.9G  2.1G  83% /
/dev/sda3        28G   27G  1.7G  95% /home
/dev/sdb        1.8T  747G  1.0T  43% 
# umount  /dev/sdb

This a small portion of:

# find  . shows  on R4 partition lots of messages like:

./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/like_data
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/logo_small.gif':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/logo_small.gif
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/max.gif':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/max.gif
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/mootools.js':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/mootools.js
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/pdf_button.png':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/pdf_button.png
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/printButton.png':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/printButton.png
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/register.png':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/register.png
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/rss.png':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/rss.png
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/script.js':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/script.js
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/shape_square_edit.png':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/shape_square_edit.png
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/style.css':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/style.css
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/submit_article.png':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/submit_article.png
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/system.css':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/system.css
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/template.css':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/template.css
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/typo.css':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/typo.css
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/universe_nav.css':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/universe_nav.css
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/universe_nav.js':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/universe_nav.js
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/xajax_core.js':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/xajax_core.js
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/icon-newsletter-trans.png':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/icon-newsletter-trans.png
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/thumb_05a3bde14acea07e18242a29.jpg':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/thumb_05a3bde14acea07e18242a29.jpg
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/thumb_0d5d2d25dd63c6031db9ac92.png':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/thumb_0d5d2d25dd63c6031db9ac92.png
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/thumb_500bcb6763e90830683131ae.jpg':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/thumb_500bcb6763e90830683131ae.jpg
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/thumb_890e5e6271c232c6e31ed2bc.jpg':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/thumb_890e5e6271c232c6e31ed2bc.jpg
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/thumb_99552b1dec3b136287217e36.jpg':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/thumb_99552b1dec3b136287217e36.jpg
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/thumb_bb0432fe5e2312794729d40b.png':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/thumb_bb0432fe5e2312794729d40b.png
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/thumb_bca9a04098b691a562b88f58.gif':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/thumb_bca9a04098b691a562b88f58.gif
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/thumb_bd2d9365bc42456b103aa73f.jpg':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/thumb_bd2d9365bc42456b103aa73f.jpg
find:
`./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/thumb_d181c232722e39114fe7a574.jpg':
No such file or directory
./linux/nagios/setting-up-email-alerts-for-network-monitoring-with-nagios_files/thumb_d181c232722e39114fe7a574.jpg

#dmesg shows:
.
.
[48126.708764] reiser4[nepomukfilewatc(1222)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 108000 (-2)
[48126.708774] reiser4[nepomukfilewatc(1222)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 108000 (-2)
[48126.708787] reiser4[nepomukfilewatc(1222)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 108027 (-2)
[48126.708797] reiser4[nepomukfilewatc(1222)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 108027 (-2)
[48126.708811] reiser4[nepomukfilewatc(1222)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 107978 (-2)
[48126.708820] reiser4[nepomukfilewatc(1222)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 107978 (-2)
[48126.708834] reiser4[nepomukfilewatc(1222)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 108008 (-2)
[48126.708844] reiser4[nepomukfilewatc(1222)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 108008 (-2)
[48126.708857] reiser4[nepomukfilewatc(1222)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 108002 (-2)
[48126.708867] reiser4[nepomukfilewatc(1222)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 108002 (-2)
[48126.708881] reiser4[nepomukfilewatc(1222)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 107983 (-2)
[48126.708890] reiser4[nepomukfilewatc(1222)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 107983 (-2)
[48126.708904] reiser4[nepomukfilewatc(1222)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 108010 (-2)
[48126.708914] reiser4[nepomukfilewatc(1222)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 108010 (-2)

# dmesg |grep -i "WARNING: Error for inode" |wc -l
1636
