From: Vitaly Fertman <vitaly@namesys.com>
Subject: http://www.namesys.com/snapshots/2004.06.14-internal.testing/
Date: Tue, 15 Jun 2004 00:22:34 +0400
Message-ID: <200406150022.34578.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19181-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello All, 

This snapshot includes reiser4progs-0.5.5, libaal-0.5.2 and updated 
grub patch.

It supports object plugin sets, includes improved mount entry detection 
code and many other bugfixes.

stage1_5 reiser4 support in grub does not work (and probably will not 
anymore) because reiser4_stage1_5 code does not fit 23,5K size limit, 
even when all not nessesary plugins are disabled (disable-short-keys, 
disable-X-hash, disable-X_fibre, disable-symlinks, etc) on configuring.
Use stage2 instead.

When you run fsck.reiser4 on your old reiser4 filesystem it should report 
about missed plugin set members in the root directory. fsck should be able 
to fix it running with the --fix option.

-- 
Thanks,
Vitaly Fertman

