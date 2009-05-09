From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Subject: 2.6.30-rc: reiserfs_delete_xattrs log spam (bug 13122)
Date: Sat, 09 May 2009 14:38:41 +0200
Message-ID: <4A057951.8040501@s5r6.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

I just switched from 2.6.29.1 to 2.6.30-rc5, and I'm getting the same as 
the reporter of http://bugzilla.kernel.org/show_bug.cgi?id=13122 alias
http://marc.info/?l=linux-kernel&m=123990989515105, i.e. repetitions of
 >>>
May  9 14:27:22 stein REISERFS warning (device sda1): jdm-20004 
reiserfs_delete_xattrs: Couldn't delete all xattrs (-13)
May  9 14:27:22 stein
<<<

This happens in irregular intervals, but a lot of times --- presumably 
when certain files are accessed.  I'm on a recently set-up Gentoo 
machine.  I created its root filesystem using the Gentoo x86-64 minimal 
boot CD; my guess is that the kernel of the boot CD had 
CONFIG_REISERFS_FS_XATTR enabled.  All kernels which I used since then 
have it disabled:  2.6.27-gentoo-r8, 2.6.29.1, now 2.6.30-rc5.
-- 
Stefan Richter
-=====-=-=== -=-= -==-=
http://arcgraph.de/sr/
