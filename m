From: Tanel Kokk <tanel.kokk@skype.net>
Subject: How to interprete ReiserFS warnings?
Date: Tue, 30 Jan 2007 14:06:38 +0200
Message-ID: <45BF34CE.7050500@skype.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30488-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

There are reiserfs warning messages in dmesg:

ReiserFS: cciss/c1d0p6: warning: vs-13060: reiserfs_update_sd: stat data
of object [454 231 0x0 SD] (nlink == 1) not found (pos 1)
ReiserFS: cciss/c1d0p6: warning: vs-13060: reiserfs_update_sd: stat data
of object [454 231 0x0 SD] (nlink == 1) not found (pos 1)
ReiserFS: cciss/c1d0p6: warning: vs-13060: reiserfs_update_sd: stat data
of object [454 231 0x0 SD] (nlink == 1) not found (pos 1)

reiserfsck /dev/cciss/c1d0p6 didn't find any errors.

my question is: how can I find out, to which file this "[454 231 0x0 SD]
data of object" refers?

my system: linux-2.6.18.3 SMP
distro: debian sarge 3.1
reiserfsprogs-v3.6.19-1


Tanel


