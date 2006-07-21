From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 status (correction)
Date: Fri, 21 Jul 2006 02:44:02 -0600
Message-ID: <44C093D2.1040703@namesys.com>
References: <44BFFCB1.4020009@namesys.com> <44C043B5.3070501@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29098-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C043B5.3070501@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com, LKML <linux-kernel@vger.kernel.org>, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>

David Masover wrote:

> Hans Reiser wrote:
>
>> On a more positive note, Reiser4.1 is getting closer to release....
>
>
> Good news!  But it's been awhile since I've followed development, and
> the homepage seems out of date (as usual).  Where can I find a list of
> changes since v4?
>
> By "out of date", I mean things like this:
>
> "Reiser4.1 will modify the repacker to insert controlled "air holes",
> as it is well known that insertion efficiency is harmed by overly
> tight packing."

Sigh, no, the repacker will probably be after 4.1....

The list of tasks for zam looks something like:

fix bugs that arise

debug read optimization code (CPU reduction only, has no effect on IO),
1 week est.  (would be nice if it was less)

review compression code 1 day per week until it ships.

fix fsync performance (est. 1 week of time to make post-commit writes
asynchronous, maybe 3 weeks to create fixed-reserve for write twice
blocks, and make all fsync blocks write twice)

write repacker (12 weeks).

I am not sure that putting the repacker after fsync is the right choice....

The task list for vs looks like:

* fix bugs as they arise.

* fix whatever lkml complains about that either seems reasonable, or
that akpm agrees with.

* Help edward get the compression plugins out the door.

* Improve fsck's time performance.

* Fix any V3 bugs that Chris and Jeff don't fix for us.  Which reminds
me, I need to check on whether the 90% full bug got fixed....

