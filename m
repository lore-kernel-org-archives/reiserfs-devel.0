From: Dirk Schenkewitz <Dirk.Schenkewitz@interface-ag.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Thu, 20 Feb 2003 10:55:58 +0100
Message-ID: <3E54A62E.39F38136@interface-ag.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12845-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Juan Quintela <quintela@mandrakesoft.com>
Cc: Reiserfs List <reiserfs-list@namesys.com>

Hi Juan,

Juan Quintela wrote (in response to me):
>
> dirk> Not at my system - I have (for example) a 16 Gig partition with
> dirk> ext3 on it which is 100% full and has now 6100 kilobytes free space.
> dirk> No Problem (with getting ENOSPC, I mean :-)).
> dirk> Oh - wait a sec: do you usually reserve 5%-10% for the superuser?
> dirk> That might explain why you get ENOSPC at 95%-90%, because that
> dirk> reserved space is not taken into account... I normally tune the
> dirk> fs to reserve 0% for the superuser. I never needed the reserved
> dirk> space anyway.
> 
> that 5-10% is there not for the superuser (with today disks, that is
> a lot of space).  I was also going to reduce the percentage, but then
> somebody explained me that this porcentange needs to be free at all
> times to maintain the fragmentation low. And that makes a lot of
> sense, the bigger the disk, the more free space you need to have low
> fragmentation.


Thanks - I didn't know that... although it's logical. Hmm... high frag-
mentation should result in a slower access to (or better: higher response
time from) the fs, right? I haven't noticed some (I mean, it can be there,
but it cannot be very much). Then again, I did not do timing measurements,
and filesystems which get that full are not "working" filesystems, but 
"storage" filesystems, so there is not much movement on them. Hmm...
perhaps I should do a defragmentation on one of these filesystems and
compare before/after.

Have fun
	dirk
-- 
Dirk Schenkewitz 

InterFace AG                 fon: +49 (0)89 / 610 49 - 126
Leipziger Str. 16            fax: +49 (0)89 / 610 49 - 83
D-82008 Unterhaching         
http://www.interface-ag.de   mailto:dirk.schenkewitz@interface-ag.de
