From: Anders Widman <andewid@tnonline.net>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 17:53:55 +0100
Message-ID: <51115850843.20030212175355@tnonline.net>
References: <93F527C91A6ED411AFE10050040665D0049C06D5@corpusmx1.us.dg.com>
 <200302130522.35829.sam@vilain.net>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12725-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302130522.35829.sam@vilain.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> On Wed, 12 Feb 2003 08:43, berthiaume_wayne@emc.com wrote:
>> Dirk, I'd be interested in hearing from you your performance
>> experience with ext3 when it reaches 96% full.

> No problem, because you get ENOSPC at 95% or 90%.

> Hmm, another feature SysAdmins actually find useful, missing in reiserfs.
> Along with quotas (this feature is a lazy case of a quota, really).

> On Wed, 12 Feb 2003 18:12, Ross Vandegrift wrote:
>> You have to start your software on some kind of foundation.  Working
>> hardware sounds like a great place to me.

> Hmm, you've never heard of redundancy or fault tolerance then.

> What part fails the most in running systems ?  Disk platters.

> CPUs might overheat and RAM might suddenly one day get a sticky bit, but as
> you point out there ain't much you can do about it.  Except buy a Tandem,
> or use ECC memory.

> But with disks, you can.  Mirroring aside, modern hard disks use S.M.A.R.T.
> technology which claims to be able to spot failures before they happen.
> Many BIOSes will let you turn this feature  on and off.  Of course I've
> never actually seen it in action :-).

  To my experience with professionally working on the hardware systems
  part  I  very rarely seen SMART working, and I have handled probably
  1000's of bad drives.

  SMART  sounds  good  on  paper, but in reality it does not work. The
  reason  is  that manufacturers do not want RMAs, and if SMART worked
  as it should they would have much higher costs with bad drives (most
  users  run  without  knowing about them, or knowing they are covered
  with warranty).

  
> Not only that, but re-attempting a failed read might just work.  In that
> case, you need to freshen the data (hopefully the disk will re-map the
> block once it sees a write), and if that fails, re-map the block. I don't
> know if any of the other filesystems do that (I seriously doubt it), but
> it's what Norton 4.5 on DOS used to do to `repair' faulty disks :-).

  :) yes, and many other programs too. Scandisk (which I do not see as
  a role model ;).

> But doing disk repair is entirely irrelevant for a filesystem.  What's
> important is that you don't get an Oops, a kernel Segfault or worse random
> data corruption or file structure mangling, that the calling process gets
> EIO instead.

  Agreed,  the  FS  should not repair the drive, though it should keep
  working when problems occur.

> Stopping random corruption from violating your assumptions is extremely
> difficult; a software engineer's nightmare :-).  However, modern disks are
> pretty good at keeping their own CRCs, so you should expect that you can
> always get an error code back from the OS if the data didn't come back the
> same state you wrote it.

> You (the reiserfs team) need to wire up reiserfs on a custom loopback
> device, and selectively flick blocks to faulty and see what happens.  It's
> just a part of stress testing.

> And there is no excuse - reiserfsck should do the right thing when it
> encounters a filesystem with bad blocks and recover what is possible,
> marking the bad blocks as bad.  It needs dd_rescue built into its 
> operation :-).

Ok, lets not jump on the ReiserFS team. They are doing a wonderful job
with  their  filesystem.  This  is  a  concern  for  all  FS, not only
ReieserFS.

> It must suck having a free project get only slight funding.  All of a
> sudden a whole load of geeks get very angry and demanding.  I wish I could
> help, but hey it's more fun to troll.^H^H^H I've got better things to do.

You are free to donate your hard earned money to them.

 - Anders



