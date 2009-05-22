From: doiggl@velocitynet.com.au
Subject: Reiser4 module and 2.6.29-x-default kernel
Date: Fri, 22 May 2009 23:09:58 +1000 (EST)
Message-ID: <13991.202.168.22.19.1242997798.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org

Hello,
How can I manually create a installable reiser4 rpm module for a new
kernel, because the opensuse build service seems stuck on a older kernel .
I need all of the steps please, (commands please) so I can create the
installable rpm module.

2. In the past, I've used the reiser4-kmp-default-0.1_2.6.27.7_9.1-27.3
(2.6.27.7-9-default) opensuse 11.1 with good success and has worked well
for me.

# uname -a
Linux test 2.6.27.7-9-default #1 SMP 2008-12-04 18:10:04 +0100 x86_64 x86_64
x86_64 GNU/Linux

# rpm -ivhU reiser4-kmp-default-0.1_2.6.27.7_9.1-27.3.x86_64.rpm
warning: reiser4-kmp-default-0.1_2.6.27.7_9.1-27.3.x86_64.rpm: Header V3 DSA
signature: NOKEY, key ID 74de2879
Preparing...                ###########################################
[100%]
   1:reiser4-kmp-default    ###########################################
[100%]
24831 blocks
24831 blocks

#  modprobe -v  reiser4
insmod
/lib/modules/2.6.27.7-9-default/kernel/lib/zlib_deflate/zlib_deflate.ko
insmod /lib/modules/2.6.27.7-9-default/kernel/lib/lzo/lzo_compress.ko
insmod /lib/modules/2.6.27.7-9-default/kernel/lib/lzo/lzo_decompress.ko
insmod /lib/modules/2.6.27.7-9-default/updates/reiser4.ko

# rpm -qlp reiser4-kmp-default-0.1_2.6.27.7_9.1-27.3.x86_64.rpm
warning: reiser4-kmp-default-0.1_2.6.27.7_9.1-27.3.x86_64.rpm: Header V3
DSA signature: NOKEY, key ID 74de2879
/lib/modules/2.6.27.7-9-default
/lib/modules/2.6.27.7-9-default/updates
/lib/modules/2.6.27.7-9-default/updates/reiser4.ko

3. My new system details with 11.2-Milestone1 (new)
===================================================
I want to install reiser 4 on it reiser4-kmp-default with 2.6.29-XX-default

3a. System installed with 11.2-Milestone1 -
http://download.opensuse.org/distribution/11.2-Milestone1/iso/openSUSE-KDE4-LiveCD-Build0067-i686.iso
# uname -a
Linux linux 2.6.29-6-default #1 SMP 2009-03-24 15:38:18 +0100 x86_64
x86_64 x86_64 GNU/Linux

How can I manually create a installable reiser4 rpm module.
I need all of the steps please, (commands please) so I can create the rpm
module with the three files (see below).

Other references I looked at but I did not understand the reiser4.spec and
how the files (see below) are generated and packaged for a newer kernel..

# rpm -qlp reiser4-kmp-default-0.1_2.6.27.7_9.1-27.3.x86_64.rpm
warning: reiser4-kmp-default-0.1_2.6.27.7_9.1-27.3.x86_64.rpm: Header V3
DSA signature: NOKEY, key ID 74de2879
/lib/modules/2.6.27.7-9-default
/lib/modules/2.6.27.7-9-default/updates
/lib/modules/2.6.27.7-9-default/updates/reiser4.ko

https://build.opensuse.org/package/view_file?file=reiser4.spec&package=reiser4-kmp&project=drivers%3Afilesystems

Thankyou for your help and time.
Glenn

