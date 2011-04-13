From: <doiggl@velocitynet.com.au>
Subject: Re: ls: reading directory .: Input/output error on reiser4 partition
Date: Wed, 13 Apr 2011 10:22:20 +1000
Message-ID: <c59db37f1b8b116c026231fb156ae01c@mail.velocitynet.com.au>
References: <bbbd01a6540b1e8806d343871853ef25@mail.velocitynet.com.au> <4DA308C3.30304@gmail.com> <e1e039f5a7cc6feeae0eb475c0c9204e@mail.velocitynet.com.au> <4DA322AF.4050004@gmail.com> <3902b176fc930c92f7de292ffced6760@mail.velocitynet.com.au> <4DA48980.2080001@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4DA48980.2080001@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

This may be related, just fyi --Glenn.
#dmesg

[  499.298559] WARNING: Failed to save sd for 65595: -2
[  499.298715] reiser4[mv(3563)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.2/linux-2.6.38.2/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[  499.298721] WARNING: Error for inode 65595 (-2)
[  499.298730] reiser4[mv(3563)]: write_sd_by_inode_common
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.2/linux-2.6.38.2/fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[  499.298736] WARNING: Failed to save sd for 65595: -2
[  499.298892] reiser4[mv(3563)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.2/linux-2.6.38.2/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[  499.298898] WARNING: Error for inode 65595 (-2)
[  499.298908] reiser4[mv(3563)]: write_sd_by_inode_common
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.2/linux-2.6.38.2/fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[  499.298914] WARNING: Failed to save sd for 65595: -2
[  499.299121] reiser4[mv(3563)]: reiser4_unlink_common
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.2/linux-2.6.38.2/fs/reiser4/plugin/inode_ops.c:300)[nikita-3398]:
[  499.299127] WARNING: Cannot unlink 65595 (-2)
[  499.299155] reiser4[mv(3563)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.2/linux-2.6.38.2/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[  499.299161] WARNING: Error for inode 65595 (-2)
[  499.299169] reiser4[mv(3563)]: write_sd_by_inode_common
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.2/linux-2.6.38.2/fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[  499.299174] WARNING: Failed to save sd for 65595: -2
[  499.299282] reiser4[mv(3563)]: reiser4_unlink_common
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.2/linux-2.6.38.2/fs/reiser4/plugin/inode_ops.c:300)[nikita-3398]:
[  499.299288] WARNING: Cannot unlink 65584 (-2)
[  499.299315] reiser4[mv(3563)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.2/linux-2.6.38.2/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[  499.299321] WARNING: Error for inode 65584 (-2)
[  499.299331] reiser4[mv(3563)]: write_sd_by_inode_common
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.2/linux-2.6.38.2/fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[  499.299337] WARNING: Failed to save sd for 65584: -2
[  499.299423] reiser4[mv(3563)]: reiser4_unlink_common
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.2/linux-2.6.38.2/fs/reiser4/plugin/inode_ops.c:300)[nikita-3398]:
[  499.299430] WARNING: Cannot unlink 65583 (-2)
[  499.299457] reiser4[mv(3563)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.2/linux-2.6.38.2/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[  499.299463] WARNING: Error for inode 65583 (-2)
[  499.299472] reiser4[mv(3563)]: write_sd_by_inode_common
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.2/linux-2.6.38.2/fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:
[  499.299478] WARNING: Failed to save sd for 65583: -2
[  499.299562] reiser4[mv(3563)]: reiser4_unlink_common
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.2/linux-2.6.38.2/fs/reiser4/plugin/inode_ops.c:300)[nikita-3398]:
[  499.299569] WARNING: Cannot unlink 945688 (-2)
[  499.299597] reiser4[mv(3563)]: key_warning
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.2/linux-2.6.38.2/fs/reiser4/plugin/file_plugin_common.c:511)[nikita-717]:
[  499.299602] WARNING: Error for inode 945688 (-2)
[  499.299612] reiser4[mv(3563)]: write_sd_by_inode_common
(/usr/src/packages/BUILD/kernel-reiser4-2.6.38.2/linux-2.6.38.2/fs/reiser4/plugin/file_plugin_common.c:34)[nikita-2221]:

