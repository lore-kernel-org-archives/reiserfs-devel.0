From: Kelledin <kelledin+RFS@skarpsey.dyndns.org>
Subject: Re: Bug in reiserfsck 3.6.5
Date: Wed, 9 Apr 2003 23:12:25 -0500
Message-ID: <200304092312.25859.kelledin+RFS@skarpsey.dyndns.org>
References: <200304090557.29034.kelledin+RFS@skarpsey.dyndns.org> <20030409141506.A2757@namesys.com> <3E945593.2090508@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13629-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E945593.2090508@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wednesday 09 April 2003 12:17 pm, Hans Reiser wrote:
> >Thanks for the analysis. Actually we already performed it
> > some time ago. Grab the patch for reiserfsprogs-3.6.5 from
> >ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.5-f
> >lush_buffers-bug.patch

Ahhh, thnx, that took care of it. :)  I'd probably have noticed 
that patch if I checked the FTP directory out of habit...

> please feel encouraged to do more debugging for us though.....

Heh, I can't promise much; I am shamelessly self-centered when it 
comes to debugging. ;)  I only go out of my way like this for 
stuff that affects me, else I'd lose all my hair by the time I 
was thirty!

-- 
Kelledin
"If a server crashes in a server farm and no one pings it, does 
it still cost four figures to fix?"

