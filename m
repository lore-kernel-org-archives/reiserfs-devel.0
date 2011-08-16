From: <doiggl@velocitynet.com.au>
Subject: WARNING: Error for inode nnnnnn (-2) -what does it mean ?
Date: Wed, 17 Aug 2011 08:21:22 +1000
Message-ID: <143ea73024ec2e253506fcb31961220d@mail.velocitynet.com.au>
References: <7517c61bff9e4f9a22f8ca0569f66617@mail.velocitynet.com.au> <caaba6f1759ccf61bba0be358d532fe6@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <caaba6f1759ccf61bba0be358d532fe6@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
I am running a #tar -cvf command on part of a reiser4 directory tree which
contains some files

1. I  see this in #dmesg
[14406.795709] reiser4[du(22426)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.8/linux-2.6.38.8/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[14406.795715] WARNING: Error for inode 972957 (-2)
[14406.795870] reiser4[du(22426)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.8/linux-2.6.38.8/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[14406.795876] WARNING: Error for inode 972958 (-2)
[14406.795930] reiser4[du(22426)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.8/linux-2.6.38.8/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[14406.795934] WARNING: Error for inode 972959 (-2)
[14406.795985] reiser4[du(22426)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.8/linux-2.6.38.8/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[14406.795990] WARNING: Error for inode 972960 (-2)

what does mean ?

Thanks Glenn


