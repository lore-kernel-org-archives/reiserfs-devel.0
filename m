From: Dirk Schenkewitz <Dirk.Schenkewitz@interface-ag.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Mon, 17 Feb 2003 11:04:08 +0100
Message-ID: <3E50B398.306B0AC7@interface-ag.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12784-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs List <reiserfs-list@namesys.com>

Sorry for being that late, I didn't see it on first view.

Sam Vilain wrote:

> On Wed, 12 Feb 2003 08:43, berthiaume_wayne@emc.com wrote:
> > Dirk, I'd be interested in hearing from you your performance
> > experience with ext3 when it reaches 96% full.
> 
> No problem, because you get ENOSPC at 95% or 90%.

Not at my system - I have (for example) a 16 Gig partition with
ext3 on it which is 100% full and has now 6100 kilobytes free space.
No Problem (with getting ENOSPC, I mean :-)).
Oh - wait a sec: do you usually reserve 5%-10% for the superuser?
That might explain why you get ENOSPC at 95%-90%, because that
reserved space is not taken into account... I normally tune the
fs to reserve 0% for the superuser. I never needed the reserved
space anyway.

> Hmm, another feature SysAdmins actually find useful, missing in 
> reiserfs.
> Along with quotas (this feature is a lazy case of a quota, really).
> 
> On Wed, 12 Feb 2003 18:12, Ross Vandegrift wrote:
> > You have to start your software on some kind of foundation.
> > Working hardware sounds like a great place to me.
> 
> Hmm, you've never heard of redundancy or fault tolerance then.
> 
> What part fails the most in running systems ?  Disk platters.
> 
> CPUs might overheat and RAM might suddenly one day get a sticky bit,

Even then I'd like the OS to find out about that and inform me...

> but as  you point out there ain't much you can do about it.
> Except buy a Tandem, or use ECC memory.
>
> But with disks, you can.  Mirroring aside, modern hard disks use S.M.A.R.T. 
> technology which claims to be able to spot failures before they happen.  
> Many BIOSes will let you turn this feature on and off.  Of course I've 
> never actually seen it in action :-).

For me the most important thing is: if something is vital to a fs,
it must be protected even against hardware failure as good as possible.
For example, by making copies, or (perhaps) at least having reserved
space for a copy, and if some access fails, mark the blocks as bad,
give a warning (important) and start using the reserved space. 

Have fun
	dirk
-- 
Dirk Schenkewitz 

InterFace AG                 fon: +49 (0)89 / 610 49 - 126
Leipziger Str. 16            fax: +49 (0)89 / 610 49 - 83
D-82008 Unterhaching         
http://www.interface-ag.de   mailto:dirk.schenkewitz@interface-ag.de
