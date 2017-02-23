From: <doiggl@velocitynet.com.au>
Subject: How do I make read-only file system [reiser4 disk /dev/sdb] writable.
Date: Thu, 23 Feb 2017 21:34:52 +1100
Message-ID: <f65554657b8bebcaa433636a0c792600@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
How do I make read-only file system [reiser4 disk /dev/sdb] writable.

- allow tar to complete instead of failing with:
  tar: Exiting with failure status due to previous errors

- allow rm to work to remove files  

- allow tar to access  the acessable files and store them on another disk
with tar
- reiser4 to be repaired 
- repair metadata

using opensuse
Thanks for your help
--Glenn

steps done so far:

# mount /dev/sdb /media/disk

# df -h
Filesystem Size Used Avail Use% Mounted on
/dev/sdb 1.8T 747G 1.0T 43% /media/disk

# id
uid=0(root) gid=0(root) groups=0(root)

# ll /media/disk
ls: cannot access /media/disk/nvidia-installer.log: No such file or
directory
ls: cannot access /media/disk/opensuseurl.txt: No such file or directory
ls: cannot access /media/disk/packman.txt: No such file or directory
ls: cannot access /media/disk/q1.txt: No such file or directory
ls: cannot access /media/disk/q1.txt~: No such file or directory
ls: cannot access /media/disk/read-only,txt: No such file or directory
ls: cannot access /media/disk/remove.txt: No such file or directory
ls: cannot access /media/disk/repos.txt: No such file or directory
ls: cannot access /media/disk/rpmlist.log: No such file or directory
ls: cannot access /media/disk/to-remove: No such file or directory
ls: cannot access /media/disk/x: No such file or directory
ls: cannot access /media/disk/zgl: No such file or directory
ls: cannot access /media/disk/lost_name_2a:73746200000000:3f1ed: No such
file or directory
ls: cannot access /media/disk/pub_linux_utils_fs_reiser4_libaal.html: No
such file or directory
total 180
drwx------ 4 root root 4 Sep 5 15:42 .Trash-0
lrwxrwxrwx 1 root root 55 Jul 5 2009
NVIDIA-Linux-x86_64-185.18.14-pkg2.run ->
nvidia/laptop-7x/NVIDIA-Linux-x86_64-185.18.14-pkg2.run

drwxr-xr-x 2 root root 863 Feb 22 2010 packages
drwxr-xr-x 5 root root 14 May 14 2011 packman
?????????? ? ? ? ? ? packman.txt
drwxr-xr-x 3 root root 4 Aug 11 2009 partitioning
drwxr-xr-x 7 root root 17 Nov 3 2009 phoronix
drwxr-xr-x 2 root root 3 Mar 15 2011 pictures
drwxr-xr-x 3 root root 4 Sep 23 2009 plugins
?????????? ? ? ? ? ? pub_linux_utils_fs_reiser4_libaal.html
?????????? ? ? ? ? ? q1.txt
?????????? ? ? ? ? ? q1.txt~
?????????? ? ? ? ? ? read-only,txt
?????????? ? ? ? ? ? remove.txt
?????????? ? ? ? ? ? repos.txt
drwxr-xr-x 3 root root 4 Jan 25 2010 rpm-description
drwxr-xr-x 4 root root 8 Sep 23 2009 rpm-help
?????????? ? ? ? ? ? rpmlist.log
drwxr-xr-x 2 root root 22 Jul 22 2010 rpms-old
drwxr-xr-x 2 root root 4 Jun 3 2011 sharon
?????????? ? ? ? ? ? to-remove
?????????? ? ? ? ? ? x
?????????? ? ? ? ? ? zgl
drwxr-xr-x 2 root root 6 Jul 20 2011 zz-iso


# echo zzzzzzzzzz >/media/disk/zjunk.txt
bash: /media/disk/zjunk.txt: Read-only file system

#tar attempt to retreive accessible files
tar failed after processing 41063 files.

# wc -l /home/r4/r4-sdb-file-list/r4files-sdb.log
41063 /home/r4/r4-sdb-file-list/r4files-sdb.log


##
A short tar sample:

# tar -cvf /media/disk2/r4files.tar /media/disk| tee
/home/r4/r4-sdb-file-list/r4files-sdb.log
media/disk/iso-factory/openSUSE-DVD-Build0146-x86_64.m3.morrors._files/
/media/disk/java/
/media/disk/java/Java_files/
/media/disk/java/java-help_files/
/media/disk/java/java-help-libnpjp2.so_files/
/media/disk/java/jre-6u14-linux-x64-rpm.bin
/media/disk/java/jre-6u14-linux-x64-rpm.bin.bak
/media/disk/jb-hifi/
/media/disk/jb-hifi/presario14-Aug09_files/
/media/disk/jb-hifi/acer-AS5536-644G32_files/
/media/disk/jibjab/
/media/disk/jibjab/2009/
/media/disk/jibjab/2009/JibJab History_files/
/media/disk/jibjab/2009/The Making of -Never a Year Like 09_files/
/media/disk/jibjab/JibJab-info_files/
/media/disk/jibjab/JibJab-info_files/JibJab_This_Land.png
/media/disk/jibjab/funnies/
/media/disk/jibjab/funnies/bush-y2005.flv
/media/disk/jibjab/info_files/

tar:
/media/disk/linux/create-video/youtube-videos-with-linux-part-2_files/show_ads.js:
File removed before we read it
tar:
/media/disk/linux/create-video/youtube-videos-with-linux-part-2_files/style.css:
File removed before we read it
tar:
/media/disk/linux/create-video/youtube-videos-with-linux-part-2_files/system.css:
File removed before we read it
tar:
/media/disk/linux/create-video/youtube-videos-with-linux-part-2_files/template.css:
File removed before we read it
tar:
/media/disk/linux/create-video/youtube-videos-with-linux-part-2_files/test_domain.js:
File removed before we read it
tar:
/media/disk/linux/create-video/youtube-videos-with-linux-part-2_files/typo.css:
File removed before we read it
tar:
/media/disk/linux/create-video/youtube-videos-with-linux-part-2_files/universe_nav.css:
File removed before we read it
tar:
/media/disk/linux/create-video/youtube-videos-with-linux-part-2_files/universe_nav.js:
File removed before we read it
tar:
/media/disk/linux/create-video/youtube-videos-with-linux-part-2_files/xajax_core.js:
File removed before we read it
tar:
/media/disk/linux/create-video/youtube-videos-with-linux-part-2_files/thumb_029c506ac1a3020ff6e0156a.png:
File removed before we read it
tar:
/media/disk/linux/create-video/youtube-videos-with-linux-part-2_files/thumb_05a3bde14acea07e18242a29.jpg:
File removed before we read it
tar:
/media/disk/linux/create-video/youtube-videos-with-linux-part-2_files/thumb_3296cddbcbc12f217d1e46fb.jpg:
File removed before we read it
tar:
/media/disk/linux/create-video/youtube-videos-with-linux-part-2_files/thumb_41d300265f61afe528569fbb.png:
File removed before we read it
tar:
/media/disk/linux/create-video/youtube-videos-with-linux-part-2_files/thumb_9746bf1652bf30d720f3ef9f.jpg:
File removed before we read it
tar:
/media/disk/linux/create-video/youtube-videos-with-linux-part-2_files/thumb_aa62405f12ea49f90e03b287.png:
File removed before we read it

/media/disk/k3b/
/media/disk/k3b/k3b-fixate-error1.png
/media/disk/k3b/k3b-mp3-support_files/
/media/disk/k3b/k3b-mp3-support_files/bookmarksite_digg.gif
/media/disk/k3b/k3b-mp3-support_files/bookmarksite_google.gif
/media/disk/k3b/k3b-mp3-support_files/caf4926.jpeg
/media/disk/k3b/k3b-mp3-support_files/collapse_thead.gif
/media/disk/k3b/k3b-mp3-support_files/connection-min.js
/media/disk/k3b/k3b-mp3-support_files/founded_novell.gif
/media/disk/k3b/k3b-mp3-support_files/ga.js
/media/disk/k3b/k3b-mp3-support_files/geeko.jpg
/media/disk/k3b/k3b-mp3-support_files/geeko_icon.png
/media/disk/k3b/k3b-mp3-support_files/icon1.gif
/media/disk/k3b/k3b-mp3-support_files/im_msn.gif
/media/disk/k3b/k3b-mp3-support_files/linkback_about.gif
/media/disk/k3b/k3b-mp3-support_files/linkback_url.gif
/media/disk/k3b/k3b-mp3-support_files/lizards.png
/media/disk/k3b/k3b-mp3-support_files/menu_open.gif
/media/disk/k3b/k3b-mp3-support_files/mode_hybrid.gif
/media/disk/k3b/k3b-mp3-support_files/mode_linear.gif
/media/disk/k3b/k3b-mp3-support_files/mode_threaded.gif
/media/disk/k3b/k3b-mp3-support_files/navbits_start.gif
/media/disk/k3b/k3b-mp3-support_files/opensuse_forums.png
/media/disk/k3b/k3b-mp3-support_files/post_old.gif
/media/disk/k3b/k3b-mp3-support_files/printer.gif
/media/disk/k3b/k3b-mp3-support_files/quote.gif
/media/disk/k3b/k3b-mp3-support_files/reply.gif
/media/disk/k3b/k3b-mp3-support_files/reputation_balance.gif
/media/disk/k3b/k3b-mp3-support_files/reputation_highpos.gif
/media/disk/k3b/k3b-mp3-support_files/reputation_pos.gif
/media/disk/k3b/k3b-mp3-support_files/smile.png
/media/disk/k3b/k3b-mp3-support_files/style.css
/media/disk/k3b/k3b-mp3-support_files/style_print.css
/media/disk/k3b/k3b-mp3-support_files/user_offline.gif
/media/disk/k3b/k3b-mp3-support_files/user_online.gif
/media/disk/k3b/k3b-mp3-support_files/vbulletin_global.js
/media/disk/k3b/k3b-mp3-support_files/vbulletin_lightbox.js
/media/disk/k3b/k3b-mp3-support_files/vbulletin_menu.js
/media/disk/k3b/k3b-mp3-support_files/viewpost.gif
/media/disk/k3b/k3b-mp3-support_files/wink.png
/media/disk/k3b/k3b-mp3-support_files/yahoo-dom-event.js
/media/disk/k3b/k3b-mp3-support_files/bookmarksite_delicious.gif
/media/disk/k3b/k3b-mp3-support_files/bookmarksite_stumbleupon.gif
/media/disk/k3b/slow-unsteady-burning-via-k3b-1_files/
/media/disk/k3b/slow-unsteady-burning-via-k3b-2_files/
/media/disk/k4/
/media/disk/k4/repodata/
/media/disk/k4/repodata/2c3b415c9e793bbf4f73212ada97fb4d2ed437036e74f606cea1dea665496ee3-filelists.xml.gz
/media/disk/k4/repodata/9ca715d78bb7c34b933c053329320e78759ebc2ae2808bcd7a2f91328165fbaa-primary.xml.gz
/media/disk/k4/repodata/d949bac17eca4c78ee18b2363542ae24b8e17b3d9b8c87b8685b9a29a9464fe3-other.xml.gz
/media/disk/k4/NetworkManager-kde4-0.9.svn1128615-2.1.x86_64.rpm
/media/disk/k4/NetworkManager-kde4-libs-0.9.svn1128615-2.1.x86_64.rpm
/media/disk/k4/akonadi-runtime-1.3.80-2.3.x86_64.rpm
/media/disk/k4/akregator-4.4.3-222.9.x86_64.rpm
.
.
.
tar:
/media/disk/gramps3.1.2/project_files/d79616993dab466bee3456e8ac46bfee.png:
File removed before we read it
tar:
/media/disk/gramps3.1.2/project_files/da9c3f343fd127052374c19e51637d53.png:
File removed before we read it
tar:
/media/disk/gramps3.1.2/project_files/e0f875deca04609b40a3a35dfd858618.png:
File removed before we read it
tar:
/media/disk/gramps3.1.2/project_files/e525e1d7589ae4b16abbb0a1dc5992ce.png:
File removed before we read it
tar:
/media/disk/gramps3.1.2/project_files/eebc1b9d470218b7e5f1ea91cced0371.png:
File removed before we read it
tar:
/media/disk/gramps3.1.2/project_files/fcf5d2036934dfa7ef2d7a77d50a235e.png:
File removed before we read it
tar: /media/disk/gramps3.1.2/project_files/publish_enabled_grey.png: File
removed before we read it
/media/disk/gramps3.1.2/gramps3-3.1.2-4.2.src.rpm
tar: /media/disk/gramps3.1.2/gramps3-3.1.2-4.2.noarch.rpm: File removed
before we read it
tar: Exiting with failure status due to previous errors



