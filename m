From: Christophe Saout <christophe@saout.de>
Subject: Re: [PATCH] updated data=ordered patch for 2.6.3
Date: Mon, 01 Mar 2004 14:30:12 +0100
Message-ID: <1078147812.7623.4.camel@leto.cs.pocnet.net>
References: <1077165373.22253.45.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16987-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1077165373.22253.45.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Hi,

> Also, the code has some extra performance tweaks to smooth out
> performance both with and without data=ordered.  There are new
> mechanisms to trigger metadata/commit block writeback and to help
> throttle writers.  The goal is to reduce the huge bursts of io during a
> commit and during data=ordered writeback.

It seems you introduced a bug here. I installed the patches yesterday
and found a lockup on my notebook when running lilo (with /boot on the
root reiserfs filesystem).

A SysRq-T showed that lilo is stuck in fsync:

lilo:
schedule
sleep_on
default_wake_function
sys_sched_yield
let_transaction_grow
__commit_trans_jl
reiserfs_sync_file
sys_fsync

reiserfs/0:
worker_thread
flush_async_commits
default_wake_function
...

The problem is 100% reproducable here. Perhaps it has something to do
with tail unpacking? This is strange:

After copying the bzImage file to /boot and running lilo he can add the
copied bzImage file, add the old file and then hangs on the third one.
But after rebooting and running lilo he already hangs on the first one.
After copying the file again he again passes the first two and hangs on
the third kernel to add.

The whole filesystem locks up when this happens, not just the lilo
process.


