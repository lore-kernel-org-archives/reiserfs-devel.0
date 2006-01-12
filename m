From: David Masover <ninja@slaphack.com>
Subject: Re: Authoring a versioning plugin
Date: Thu, 12 Jan 2006 15:58:52 -0600
Message-ID: <43C6D11C.90602@slaphack.com>
References: <200601111759.14638.fred@lab.matcom.uh.cu> <200601121014.37940.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27688-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200601121014.37940.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: reiserfs-list@namesys.com, Yoanis Gil Delgado <fred@lab.matcom.uh.cu>

Peter van Hardenberg wrote:
> Hi Yoanis, good to see you're still pursuing this.
> 
> On January 11, 2006 02:59 pm, Yoanis Gil Delgado wrote:


> I would second Hans' suggestion about a "..../version/snapshot" file which 
> would essentially act like a "cvs commit" on that file. I'd suggest that 
> there be two similar versioning plugins, one which automatically versions 
> after each write, and one which only does it when explicitly asked to. See 
> the fibration plugin type for an example of this.

Sounds good.  I'd propose a third:  auto-versioning with optional 
commits.  Every commit nukes all previous auto-verisons and adds a 
long-term version.  That is:

The file

foo/.../version/1234

would be the version before

foo/.../version/auto/1

And if you committed

foo/.../version/auto/5678

it would become

foo/.../version/1235

and

foo/.../version/auto/*

would be nuked.



That way, you can protect yourself from doing something extremely 
stupid, such as "rm file", without having to go back to a manual 
version, while at the same time having a sane set of manual versions 
(where you know you didn't do something *that* stupid) to keep your disk 
usage sane, and to make it easier to go back and find something that 
genuinely was a previous version, and not just an "oops, the cat stepped 
on the keyboard and nuked all my changes" version.

