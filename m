From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Reiser4's status of this week.
Date: Sun, 20 Jun 2004 16:24:59 +0400
Message-ID: <20040620122458.GC5084@backtop.namesys.com>
References: <7794555.1087651158684.JavaMail.postfix@mx20.mail.sohu.com> <40D45B6C.7000002@namesys.com> <40D482CB.1080303@netscape.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19279-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40D482CB.1080303@netscape.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas S. Wourms" <nwourms@netscape.net>
Cc: reiserfs-list@namesys.com

On Sat, Jun 19, 2004 at 02:15:39PM -0400, Nicholas S. Wourms wrote:
> Hans Reiser wrote:
> >stone_wang@sohu.com wrote:
> >
> >>Hi,Hans:
> >>
> >>Your website are saying "Reiser4 is in final testing, and will ship 
> >>soon!"  It has been saying that for a long time :(
> >>
> >>
> >>When could Reiser4 be finaly released? We are eager to try it.
> >>
> >>Regards.
> >>
> >>Stone.
> >>
> >>
> >> 
> >>
> >next week.  or so we hope.
> 
> Hans,
> 
> I've noticed that there seems to be a problem with your 
> reiser4-linux-2.6 bitkeeper repository.  Unlike the 2.5 version I used 
> awhile back, this one seems to just be an old copy of the stock 
> linux-2.6.5 kernel with the 2.6.5-mm2 patches added.  None of the 
> reiser4 base or extra patches seem to have been added (excluding the 
> ones for fs/reiser4).  Would someone mind fixing this?  Don't you have 
> an internal repository with all the modifications in the base and extra 
> series applied?  

Yes we have.
We work with an internal bk repository. 

The public repositories are copies of the internal ones, we have a script to
update public repositories once per day.  We will figure out after weekend 
why it does not after weekend.

> If your internal tree can't be exported, can you 
> provide a snapshot BK-style(not gnu) patch against linus-current?

we have two repositories, one for core kernel + our local changes to the core,
reiser4 itself is in another BK.  I think we can't provide one bk-style patch
easily.

> I've also noticed, as has been noted in the past, that bk pulls are 
> still broken.  Someone mentioned that it is a problem with the new bk. 
> If this is true, why not contact Larry for support?  

Flx did, but the problem still there.

> Not that it matters now, since the reiser4-linux-2.6 isn't usable, but it
> might be helpful for future syncs.
> Cheers, Nicholas

-- 
Alex.
