From: Dirk Schenkewitz <Dirk.Schenkewitz@interface-ag.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 21:05:22 +0100
Message-ID: <3E4AA902.86F15815@interface-ag.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12734-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs List <reiserfs-list@namesys.com>

Looks like i'm under a curse...

I can post, but I don't get any messages from the mailing list, 
only those that are explicitely addressed to me. I got to know
about all these other messages only because I requested the last
100 messages again :-/ Hmpf.

Back to the point:

Hans Reiser wrote (in response to Anders Widman):

> For some users it would be better to boot to a corrupted filesystem 
> because running fsck is more of a problem than putting their data at 
> higher risk.  For datalogging, it is probably conceivable to just toss 
> the journal and lose the more recent updates to it.  For the default 
> metadata journaling, this just does not seem prudent.

But I think that not everybody will know about if it's better to toss
the journal or to keep it. I wouldn't, and I know some people who are
much less interested in filesystems and the stuff around them than me.
Even SysOps.

> I really prefer making users understand that they have a problem they 
> need to do something about.  This is just my style.  I want them to fail 
> to boot, and after some effort learn that there is this thing called 
> fsck, and dd_rescue, and that it is time to buy another hard drive and 
> chuck their current one.

For me, it was alarming enough seeing ext3 drop the journal. In fact,
THAT was the point where I went to investigate in other directions
instead of blaming the filesystem. 

> It would be best though if they were given detailed instructions about
> how they need to do this when the code hits that bad block.

Agreed! The only problem is, that putting a bad drive to eternal rest
might not solve the problem, as long as the REASON for the drive gone
bad stays uncovered. (I had that said drive in use for less than 4
months (if my memory servers, er, serves my well) - it was like new.

> If we handle the journal block error without downtime, the user will 
> never chuck the hard drive, and that is bad in the longterm.

Not agreed, unless you continue without a warning.

happy coding
	dirk
-- 
Dirk Schenkewitz 

InterFace AG                 fon: +49 (0)89 / 610 49 - 126
Leipziger Str. 16            fax: +49 (0)89 / 610 49 - 83
D-82008 Unterhaching         
http://www.interface-ag.de   mailto:dirk.schenkewitz@interface-ag.de
