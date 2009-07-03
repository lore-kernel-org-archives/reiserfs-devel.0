From: <doiggl@velocitynet.com.au>
Subject: =?UTF-8?Q?reiser=34-kmp-default-=30=2E=31=5F=32=2E=36=2E=33=30=5F=38-=32?=
 =?UTF-8?Q?=38=2E=33=2Ex=38=36=5F=36=34=2Erpm=20on=20=32=2E=36=2E=33=30-?=
 =?UTF-8?Q?=38-default?=
Date: Fri, 03 Jul 2009 23:41:44 +1000
Message-ID: <fe8154fd4ae8a2a78c6164b61907dd60@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Reiserfs devel <reiserfs-devel@vger.kernel.org>

Hello
Just thought I'd report the following when installing and un-installation
of: reiser4-kmp-default-0.1_2.6.30_8-28.3.x86_64.rpm on 2.6.30-8-default

- Installation

# rpm -ivhU reiser4-kmp-default-0.1_2.6.30_8-28.3.x86_64.rpm
warning: reiser4-kmp-default-0.1_2.6.30_8-28.3.x86_64.rpm: Header V3 DSA
signature: NOKEY, key ID 74de2879
Preparing...                ###########################################
[100%]
   1:reiser4-kmp-default    ###########################################
[100%]
WARNING: /lib/modules/2.6.30-8-default/updates/reiser4.ko needs unknown
symbol breakpoint

- UnInstallation
# rpm -e reiser4-kmp-default

Kernel image:   /boot/vmlinuz-2.6.30-8-default
Initrd image:   /boot/initrd-2.6.30-8-default
Root device:    /dev/root (mounted on / as defaults)
Device root not found in sysfs
error: %postun(reiser4-kmp-default-0.1_2.6.30_8-28.3.x86_64) scriptlet
failed, exit status 1

- Result uninstall failed

Other info
# uname -a
Linux linux 2.6.30-8-default #1 SMP 2009-06-12 15:37:20 +0200 x86_64 x86_64
x86_64 GNU/Linux

# rpm -qa | grep -i kernel
kernel-default-2.6.30-8.1
kernel-default-extra-2.6.30-8.1
kernel-default-base-2.6.30-8.1

This is from the openSUSE-NET-Build0146-x86_64.iso  (11.2 milestone 3) live
cd

Question: Do I need to worry about the error messages -
WARNING: /lib/modules/2.6.30-8-default/updates/reiser4.ko needs unknown
symbol breakpoint
and
error: %postun(reiser4-kmp-default-0.1_2.6.30_8-28.3.x86_64) scriptlet
failed, exit status 1


The error messages can be reproduced on installation/uninstallation.
Thanks Glenn
