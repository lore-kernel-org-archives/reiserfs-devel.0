From: <doiggl@velocitynet.com.au>
Subject: ??? in directory listing on reier4 partition
Date: Wed, 01 Jun 2011 02:11:37 +1000
Message-ID: <83626a772bd9688776d2cce0f1dfdcba@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello, 
I spotted a directory with this in it [1] on a reiser 4 partition.
#dmesg has the following in it [2]
Is it repairable with the following command ?
# fsck.reiser4 --build-fs  /dev/sdb
Do I have to run the fsck.reiser4 command multiple times ?
Last time I ran it just once with this result.
http://www.spinics.net/lists/reiserfs-devel/msg02855.html
 
Thanks Glenn

[1]
# ll
??????????  ? ?    ?         ?            ? sysstat
??????????  ? ?    ?         ?            ? team-viewer
??????????  ? ?    ?         ?            ? tips
-rw-r--r--  1 root root  51960 Oct 23  2009
traceroute-howto-read-output.html
drwxr-xr-x  2 root root      8 Oct 23  2009
traceroute-howto-read-output_files

[2]-#dmesg output has many more lines like this.
[13582.086149] WARNING: Error for inode 965323 (-2)
[13582.086200] reiser4[ls(23149)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.6/linux-2.6.38.6/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[13582.086205] WARNING: Error for inode 965335 (-2)
[13582.086255] reiser4[ls(23149)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.6/linux-2.6.38.6/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[13582.086260] WARNING: Error for inode 965343 (-2)
[13582.086335] reiser4[ls(23149)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.6/linux-2.6.38.6/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[13582.086340] WARNING: Error for inode 965352 (-2)

