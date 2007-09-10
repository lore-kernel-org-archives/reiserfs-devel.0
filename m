From: Chris Mason <chris.mason@oracle.com>
Subject: Re: ReiserFS: clm-2100: nesting info a different FS
Date: Mon, 10 Sep 2007 09:40:16 -0400
Message-ID: <20070910094016.5ca9f72e@think.oraclecorp.com>
References: <2a12af650709060731m64d7ff9es7f702d5c300cfcc2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=MP_PXjm5JgwQnmuSIhH8YptiF5
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <2a12af650709060731m64d7ff9es7f702d5c300cfcc2@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Marti Raudsepp <marti@juffo.org>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>, fsdevel <linux-fsdevel@vger.kernel.org>

--MP_PXjm5JgwQnmuSIhH8YptiF5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, 6 Sep 2007 17:31:53 +0300
"Marti Raudsepp" <marti@juffo.org> wrote:

> Hi,
> 
> My dmesg output contains a lot of warning messages from reiserfs and
> I'm wondering if this is anything important:
> ReiserFS: dm-0: warning: clm-2100: nesting info a different FS
> 
> I'm running Hardened Gentoo kernel 2.6.16-r11 on AMD64. I've got three
> reiserfs filesystems: one for root which is mounted directly from a
> RAID1 array (/dev/md/2), and two are LVM volumes from another RAID1
> array (/dev/md/3); one of the latter has usrquota enabled. I'm not
> really sure which block device "dm-0" refers to. The computer is doing
> relatively little disk I/O most of the time.
> 
> The comment in fs/reiserfs/journal.c says:
> /* we've ended up with a handle from a different filesystem.
>  ** save it and restore on journal_end.  This should never
>  ** really happen...
>  */
> 
> The "should never really happen" part made me wonder, is this anything
> I should be worried about?

Well, it's really not supposed to happen, and hopefully it indicates
that someone is doing an allocation without GFP_NOFS when they really
should be using it.  A simple stack trace will show us pretty quickly.

Can you try a patch to add a stack trace to this warning?  I've
attached it.

-chris

--MP_PXjm5JgwQnmuSIhH8YptiF5
Content-Type: text/x-patch; name=warning.patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=warning.patch

diff -r 70b4267862e0 fs/reiserfs/journal.c
--- a/fs/reiserfs/journal.c	Mon Jul 09 00:00:31 2007 +0000
+++ b/fs/reiserfs/journal.c	Mon Sep 10 09:37:39 2007 -0400
@@ -3165,6 +3165,7 @@ int journal_begin(struct reiserfs_transa
 			 */
 			reiserfs_warning(p_s_sb,
 					 "clm-2100: nesting info a different FS");
+			WARN_ON(1);
 			th->t_handle_save = current->journal_info;
 			current->journal_info = th;
 		}

--MP_PXjm5JgwQnmuSIhH8YptiF5--
