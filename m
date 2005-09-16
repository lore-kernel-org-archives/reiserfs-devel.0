From: Bruce Israel <israel@tux.org>
Subject: Re: why does reiserfs list get so much spam?
Date: Fri, 16 Sep 2005 10:12:02 -0400
Message-ID: <20050916141202.GA1742@home.exsolent.com>
References: <432A9BFD.10700@mch.one.pl> <20050916104129.GA11025@kruemel> <432AA409.5070006@interia.pl> <Pine.LNX.4.63.0509161259560.21130@alpha.polcom.net> <432AAA38.9000102@mch.one.pl> <e692861c05091605406ad2908@mail.gmail.com> <op.sw64fwxad4os1z@localhost>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25989-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <op.sw64fwxad4os1z@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Here's my suggestion.  I don't know if Hans et al has the time for
it, but the simple solution would be to set the list up as moderated
and subscriber-only posting.  So when a list subscriber posts, it
goes through immediately.  If a non-subscriber posts (e.g. someone
from a different account, a cross-posted message thru LKML, a spam
message) then it doesn't go to the list but instead goes to the
moderator.  The moderator can skip it if it's spam or forward to the
list if it's not.  Further, the moderator can add the sender to a
whitelist so that further messages from the same person aren't
delayed. 

This has the cost of a slight delay with the first message from any
person to the list, while eliminating the spam and minimizing the
amount of maintenance and monitoring the moderator has to do.

Bruce


On Fri, Sep 16, 2005 at 02:46:34PM +0200, ?ukasz Mierzwa wrote:
> Dnia Fri, 16 Sep 2005 14:40:22 +0200, Gregory Maxwell <gmaxwell@gmail.com> 
> napisa?:
> 
> >On 9/16/05, Tomasz Chmielewski <mangoo@mch.one.pl> wrote:
> >>yeah, but it is to be used by the end-user.
> >>
> >>the archive will be still filled with spam.
> >>
> >>not everyone who wants to know about reiser subscribes to the list; most
> >>of the people would just use the archives.
> >
> >I actually subbed to the list because I was frustrated by spam in the 
> >archive.
> >Whomever runs the archive should at least just pipe it through spam
> >assassin. If some legitimate messages are lost from the web archive it
> >could not be worse than what we have now, an archive made nearly
> >useless from excessive spam.
> >
> 
> If You will look in the headers of messages that You get from this list You 
> will see that there is spamassassin running on thebsh.namesys.com, it's 
> just that it is not configured good enough.
> 
> ?ukasz Mierzwa
> 
