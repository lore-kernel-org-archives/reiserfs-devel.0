From: Redeeman <redeeman@metanurb.dk>
Subject: Re: hans! i found a bug in reiser4 :((((
Date: Mon, 12 Apr 2004 13:05:05 +0200
Message-ID: <1081767905.8170.3.camel@redeeman.linux.dk>
References: <1081698647.5514.3.camel@redeeman.linux.dk>
	 <1081755850.1183.30.camel@tribesman.namesys.com>
	 <407A6B87.1080101@fbsd.za.net>
	 <12910.144.214.5.217.1081766422.squirrel@sml.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17863-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <12910.144.214.5.217.1081766422.squirrel@sml.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

i noticed this while trying to do a livecd with gentoos cataylst, i
thught it would help speeding up on a reiser4 partition.

before that i read on the forums that it didnt compile on reiser4, but i
thought "wtf! lamer! why wouldnt it?!"

but when i moved the build to reiser4 partition, it failed. moving back
to reiserfs partition, and it builds. with absolutely no change other
than the fs change. and for cflags, im just using standard. no
optimization at all.


On Mon, 2004-04-12 at 12:40, Thomas Graham wrote:
> it seems a very serious problem, are you sure that the problem is come
> from reiserfs4 ? did you put optimize tag to none when you compile glibc ?
> because glibc is very sensative on optimize tag, please post the error
> section to mail list, so that people could help for that, I hope that's
> not reiser4 problem, errrr...
> 
> 
> > That is correct.
> >
> > Vladimir Saveliev wrote:
> >> Hello
> >>
> >>
> >> Do you mean that you put glibc sources on reiser4 and that make fails?
> >>
> >>
> >
> >
-- 
Regards, Redeeman
redeeman@metanurb.dk

