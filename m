From: Lukas Geyer <lukas@debian.org>
Subject: Re: plagiarism of reiserfs by Debian
Date: 19 Apr 2003 16:51:48 -0400
Sender: Lukas Geyer <lgeyer@umich.edu>
Message-ID: <87y926jjmj.fsf@lgeyermac.math.lsa.umich.edu>
References: <200304181604.28955.vitaly@namesys.com>
	<3EA17427.7040300@namesys.com> <87ademfifz.fsf@deneb.enyo.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13723-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87ademfifz.fsf@deneb.enyo.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, debian-devel@lists.debian.org
Cc: debian-legal@lists.debian.org

Florian Weimer <fw@deneb.enyo.de> writes:

> Hans Reiser <reiser@namesys.com> writes:
> 
> > You'll note that ReiserFS anticipated the GNU GPL V3 by including
> > clauses that forbid removal of credits in its license, and for a long
> > time I have been telling Stallman that he needs to get V3 of the GPL
> > out the door.
> 
> Oh, I think it's natural to assume that these clauses are superfluous
> because the GPL explicitly states that a distributor "may not impose
> any further restrictions on the recipients' exercise of the rights
> granted herein".  If these clauses were of any legal relevance, your
> software wouldn't be redistributable at all.
> 
> Just don't use the GPL for your software if you don't like it, but
> don't complain if anyone misunderstands your homemade license
> mishmash.

Well, usually we also try to use common sense, syllogism and rocket
science to find out what the author's intent was. Fortunately Hans
Reiser made his intent clear by posting this statement to
debian-devel. The only consequence I can see is to move reiserfsprogs
to non-free. For those who have not followed the discussion and such,
the issue seems to be the fix of #152547. If we are not allowed to
remove a screenful of advertising from the output of a program, then
this unduly restricts the freedom to distribute modified versions.

Cheers,
Lukas

P.S.: Cc'ed to debian-legal, which is probably the better place to
discuss this.

-- 
Give a man an answer, and he's satisfied today. Teach him to program,
and he will be frustrated for the rest of his life. 
