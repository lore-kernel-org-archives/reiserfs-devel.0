From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: data-logging 2.4.23 patches: 1 reject in fs/inode.c in 2.4.25
Date: Mon, 23 Feb 2004 14:48:22 +0100
Message-ID: <200402231448.22657.Dieter.Nuetzel@hamburg.de>
References: <c12ap7$vor$1@sea.gmane.org> <1077304113.26934.8.camel@watt.suse.com> <c1cv3s$iqi$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16889-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <c1cv3s$iqi$1@sea.gmane.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>, Jens Benecke <jens@spamfreemail.de>
Cc: reiserfs-list@namesys.com

Am Montag, 23. Februar 2004 14:29 schrieb Jens Benecke:
> Chris Mason wrote:
> > On Thu, 2004-02-19 at 07:40, Jens Benecke wrote:
> >> Hi,
> >>
> >> Chris' data-logging patches do not apply cleanly to 2.4.25, are they
> >> being updated?
> >>
> >> I think the fix for inode.c is not very hard but I don't dare to fiddle
> >> around with file system code. ;)
> >
> > Ok, I'll rediff the data logging + quota against 2.4.25.

Have you missed this one, Jens?

updated data logging and quota for 2.4.25
http://marc.theaimsgroup.com/?l=reiserfs&m=107749109315488&w=2

Chris, what's happening to them?

Regards,
	Dieter
