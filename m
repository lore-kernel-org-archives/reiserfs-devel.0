From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: [PATCH] new data logging and quota patches available
Date: Sat, 22 Feb 2003 13:41:23 +0100
Message-ID: <200302221341.23799.Dieter.Nuetzel@hamburg.de>
References: <1045870331.16048.325.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12860-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1045870331.16048.325.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com

Am Samstag, 22. Februar 2003 00:32 schrieb Chris Mason:
> Hello all,
>
> ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21 will soon be
> updated with a new set of data logging and quota patches against
> 2.4.21-pre4
>
> The data logging code is updated with another set of io stalling fixes,
> they should improve performance of data=ordered and data=writeback by
> being smarter about forcing commits under heavy write load and kicking
> kreiserfsd.
>
> Treat these with care, they've gotten a ton of testing under the suse
> kernel, but the port to vanilla was just done today.

Which files are needed for 2.4.21-pre4aa3?

Have a nice weekend.

-Dieter
