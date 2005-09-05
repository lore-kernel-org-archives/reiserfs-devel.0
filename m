From: Gabor HALASZ <halasz.g@freemail.hu>
Subject: we have got hash function screwed up
Date: Mon, 05 Sep 2005 18:34:23 +0200
Message-ID: <431C738F.4010803@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25864-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi!

I got the next message:

Sep  5 17:48:32 sk8n kernel: ReiserFS: dm-10: warning: 
reiserfs_add_entry: Congratulations! we have got hash function screwed up

Caused by:

17:47:43 Getting file 
'main/x/xorg-x11/xserver-xorg-dbg_6.8.2.dfsg.1-6_i386.deb' size = 21256772
17:48:32 Transfer rate:   423.79 kb/sec lastfile,    293.55 kb/sec overall
17:48:32 -- ERROR -- Creating temp file 
'main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.deb' : Device or 
resource busy
17:48:32 Retrieving file failed. Exiting.

The strange magic:

root@sk8n:~# touch 
/home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.dea
root@sk8n:~# touch 
/home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.deb
touch: cannot touch 
`/home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.deb': 
Device or resource busy
root@sk8n:~# touch 
/home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.dec
root@sk8n:~# touch 
/home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.ded
root@sk8n:~# touch 
/home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.dee

root@sk8n:~# ls -la /home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.*
-rw-r--r--  1 root root 0 2005-09-05 18:26 
/home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.dea
-rw-r--r--  1 root root 0 2005-09-05 18:26 
/home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.dec
-rw-r--r--  1 root root 0 2005-09-05 18:26 
/home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.ded
-rw-r--r--  1 root root 0 2005-09-05 18:26 
/home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.dee

and I found same message in the kernel log:

Sep  5 18:26:38 sk8n kernel: ReiserFS: dm-10: warning: 
reiserfs_add_entry: Congratulations! we have got hash function screwed up

The filsystem was clear at the last mount:

Sep  5 12:30:24 sk8n kernel: ReiserFS: dm-10: found reiserfs format 
"3.6" with standard journal
Sep  5 12:30:24 sk8n kernel: ReiserFS: dm-10: using ordered data mode
Sep  5 12:30:24 sk8n kernel: ReiserFS: dm-10: journal params: device 
dm-10, size 8192, journal first block 18, max trans len 1024, max batch 
900, max commit age 30, max trans age 30
Sep  5 12:30:24 sk8n kernel: ReiserFS: dm-10: checking transaction log 
(dm-10)
Sep  5 12:30:24 sk8n kernel: ReiserFS: dm-10: Using rupasov hash to sort 
names


The system is x86-64 (Opteron), Debian Sid from amd64.debian.net, 2.6.13 
kernel, but same with 2.6.12.5.

What can I do?!

-- 
Gabor HALASZ <halasz.g@freemail.hu>
