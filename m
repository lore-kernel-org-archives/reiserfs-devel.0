From: tomm <tomm@lime-technology.com>
Subject: Re: [PATCH] reiserfs: remove =?utf-8?b?Zmx1c2hfb2xkX2NvbW1pdHM=?=
Date: Thu, 27 Jun 2013 01:14:50 +0000 (UTC)
Message-ID: <loom.20130627T030903-284@post.gmane.org>
References: <51BF5BFE.5060702@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Jeff Mahoney <jeffm <at> suse.com> writes:

> 
> Commit 033369d1 (reiserfs: get rid of resierfs_sync_super) was introduced
> to replace the old s->dirt method of superblock writeback. Reiserfs
> always journals the superblock on modification so we weren't really using
> it anyway.

A bug with this patch is that uncommitted journal entries are left in memory
so that if the machine is reset or loses power, you are guaranteed to lose data.


