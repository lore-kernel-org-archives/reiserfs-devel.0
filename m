From: Henning Westerholt <henning@skalatan.de>
Subject: Re: auto-patches
Date: Sat, 12 Jun 2004 17:39:30 +0200
Message-ID: <200406121739.30952.henning@skalatan.de>
References: <40CB168E.50507@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19155-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40CB168E.50507@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: David Masover <ninja@slaphack.com>

Am Samstag, 12. Juni 2004 16:43 schrieb David Masover:
> I see an auto-snapshot for 2.6.7-rc3-mm1.  Good.
>
> But I don't see anything other than a diff file.  How do I use it?
>
> The latest official snapshot is 2004.03.26.  Do I use the reiser4progs
> and libaal from there?
>
> Do I apply the all.diff.gz from there, then apply the latest
> auto-snapshot?  Or do I apply the latest auto-snapshot .diff.gz on a
> fresh (no reiser4 at all) 2.6.7-rc3-mm1?

Patch the 2.6.7-rc3-mm1 tree with the auto-snapshot file. No other reiser4 
patches are needed.

> Also, I'm running reise4 as a root fs on a machine which is patched for
> 2004.03.26.  Is it safe to just install the new patches and utils?  Has
> the on-disk format changed?  What can I do if it has (other than tar it
> up)?

The auto-snapshot from 2004.06.07-19.38-linux-2.6.7-rc1-mm1 break the on-disk 
format for me. I must rebuild my partitions, as the old (2004.03.26) snapshot 
segfaults after that on bootup. I try the -rc3 snapshot later..

The old fsck complains also about some stat-data errors, and refuse to fix 
them. Perhaps the 2004.04.21-internal.testing.fixed/ snapshot works with the 
new format? 

Best regards,

Henning
