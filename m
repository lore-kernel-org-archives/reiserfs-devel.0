From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS post-crash issues
Date: Tue, 21 Sep 2004 08:09:41 -0700
Message-ID: <41504435.9050604@namesys.com>
References: <e96ff120040921013254b63c93@mail.gmail.com> <414FF986.9080301@willsmith.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21864-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <414FF986.9080301@willsmith.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Will Smith <will@willsmith.org>
Cc: reiserfs-list@namesys.com

Will Smith wrote:

> Sorry if the below is obvious...
>
> In reiser4, there's a parameter tmgr.atom_max_age which is the maximum
> time an atomic operation (=transaction in database language, I believe)
> can remain 'dirty' before being written to disk.   It defaults to 600
> seconds.  I'd argue that's too high, it should be low for safety and
> tunable up.  Maybe I don't this properly, but I see very high dirty
> values, remaining for minutes at at time, in /proc/meminfo when using 
> reiser4.
>
> In reiserfs, I'm not what the default is (but I see
> JOURNAL_MAX_TRANS_AGE=30) in reiserfs_fs.h) or how it's tunable.
>
> In ext3, I belive the default is for the journal to be flushed after 5
> seconds, and the data after 30 The ext3 limits also seem to be related
> to the kernel parameters
> vm.dirty_expire_centisecs = 3000
> vm.dirty_writeback_centisecs = 500
> (from /sbin/sysctl -a).
>
> Maybe if you are concerned about power failure events, you have to
> sacrifice performance a bit with a lower flush interval for the journal
> and/or data.
>
>
> Will Smith
>
>
>>
>
>
>
>
>
There is no right answer to that setting except to let the user control 
it.  Developers doing compiles would want it as it is, as fsync takes 
care of their edits, and repeat compiles are significantly optimized by 
write caching of them.
