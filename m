From: Ross Vandegrift <ross@willow.seitz.com>
Subject: Re: Scrambled Files
Date: Wed, 24 Apr 2002 14:42:31 -0400
Message-ID: <20020424184231.GA7963@willow.seitz.com>
References: <20020423210501.GA28270@willow.seitz.com> <3CC5E81E.7080903@namesys.com> <20020424033202.GA30417@willow.seitz.com> <200204240826.09390.kuba@mareimbrium.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10155-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200204240826.09390.kuba@mareimbrium.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kuba Ober <kuba@mareimbrium.org>
Cc: reiserfs-list@namesys.com

> > (probably in cache somewhere) 2) being written.
> >
> > For example, apt-get was messing around with xfs when it died.  xfs was
> > completely hosed, as were a bunch of things related to X.  However, the
> > files were hosed with completely non-deterministic contents - german
> > text, what appeared to be UUEncoded binaries, random data, as well as
> > some kind of regular-looking data.  It wasn't like a bunch of the writes
> > got crossed and files ended up backwards.  It also wasn't like random
> > junk was written.
> 
> What you see might be a result of metadata corruption rather than file 
> contents corruption. The metadata might be pointing to astray places, which 
> are either used or unused-but-previously-written-to places on the drive. It 
> may even be that the data from original files is sitting there intact.
> 
> As a side note: did you try fsck'ing the filesystem?
> 
> Cheers,
> Kuba

No, I figured this would probably fix the problems - unfortunately, the
machine's availability is pretty important.  So instead of gambling on
fsck (which the reiserfs devottee in me wanted to do), I started going
about restoring the system from backups and original media (as the
employee in me knew had to be done ::-)

Ross
