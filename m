From: <doiggl@velocitynet.com.au>
Subject: Is there any reason reiser4 took this long on a large file delete process.
Date: Sat, 05 Feb 2011 14:14:41 +1100
Message-ID: <9af190a7cd5249f4cd484b1cfc20b89e@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Is there any reason reiser4 took this long on a large file delete process

- File size 4,237,037,568 openSUSE-DVD-Build0957-i586.iso

# time rm /media/disk/iso/openSUSE-DVD-Build0957-i586.iso

real    12m4.027s
user    0m0.000s
sys     1m10.132s

# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/sdb              1.8T  1.1T  662G  63% /media/disk

- The disk is in externally attached , uses usb
- gkrellm showed disk was busy at ~6mb a sec during file deletion
- The volume has a mix of 353,281 directories and files  in total

I use reiser4 enabled kernel details at [2]

[2]
https://build.opensuse.org/package/binaries?package=kernel-reiser4&project=home%3Adoiggl&repository=openSUSE_11.3
https://build.opensuse.org/package/show?package=kernel-reiser4&project=home%3Adoiggl


Thanks Glenn

