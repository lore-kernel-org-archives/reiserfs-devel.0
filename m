From: doiggl@velocitynet.com.au
Subject: My results when adding reiser4 module to opensuse 11.1 RC1
Date: Mon, 15 Dec 2008 00:15:09 +1100 (EST)
Message-ID: <27709.202.168.22.19.1229260509.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Just listing my result when adding reiser4 module to opensuse 11.1 RC1.
rpm reference:
http://download.opensuse.org/repositories/drivers:/filesystems/

# uname -a
Linux test 2.6.27.7-9-default #1 SMP 2008-12-04 18:10:04 +0100 x86_64 x86_64
x86_64 GNU/Linux

# rpm -ivhU reiser4-kmp-default-0.1_2.6.27.7_9.1-27.2.x86_64.rpm
warning: reiser4-kmp-default-0.1_2.6.27.7_9.1-27.2.x86_64.rpm: Header V3 DSA
signature: NOKEY, key ID 74de2879
Preparing...                ###########################################
[100%]
   1:reiser4-kmp-default    ###########################################
[100%]
26129 blocks

#  modprobe -v  reiser4
insmod
/lib/modules/2.6.27.7-9-default/kernel/lib/zlib_deflate/zlib_deflate.ko
insmod /lib/modules/2.6.27.7-9-default/kernel/lib/lzo/lzo_compress.ko
insmod /lib/modules/2.6.27.7-9-default/kernel/lib/lzo/lzo_decompress.ko
insmod /lib/modules/2.6.27.7-9-default/updates/reiser4.ko

# mkfs.reiser4 -o create=ccreg40,compress=lzo1 /dev/sdb -fy
# fsck.reiser4 --fix /dev/sdb -y
# mkdir /reiser4
# mount -t reiser4 /dev/sdb /reiser4

# manually added reiser4 filesystem to /etc/fstab
/dev/sdb /reiser4 reiser4 defaults 0 0



