From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: fsck.reiser4 segfault with one partition
Date: Wed, 2 Jun 2004 16:04:49 +0300
Message-ID: <200406021604.49333.rmeijer@internet.gr>
References: <pan.2004.06.01.11.57.09.230448@unternehmen.com> <pan.2004.06.01.19.37.08.75221@unternehmen.com> <200406021658.17346.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18967-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406021658.17346.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wed 2 June 2004 15:58, Vitaly Fertman wrote:

> > Tried it and got the same result: fsck.reiser4 segfaults at semantic tree
> > checking.

> Can you provide the packed fs metadata for downloading?
> (debugfs.reiser4 -P /dev/xxx | bzip2 -c > xxx.bz2)

I have that problem too on one of my partitions! Do you want my metadata as 
well?


Cheers,

Ray
