From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: Scrambled Files
Date: Wed, 24 Apr 2002 08:26:09 -0400
Message-ID: <200204240826.09390.kuba@mareimbrium.org>
References: <20020423210501.GA28270@willow.seitz.com> <3CC5E81E.7080903@namesys.com> <20020424033202.GA30417@willow.seitz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10154-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020424033202.GA30417@willow.seitz.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ross Vandegrift <ross@willow.seitz.com>
Cc: reiserfs-list@namesys.com

> > >2. Is the corruption in any way deterministic? For example, does
> > >  it only affect files that have been modified since the last
> > >  sync, or perhaps files that are in the process of being modified
> > >  at the time the system goes down?
>
> In my case it seemed to affect file that were either 1) recently written
> (probably in cache somewhere) 2) being written.
>
> For example, apt-get was messing around with xfs when it died.  xfs was
> completely hosed, as were a bunch of things related to X.  However, the
> files were hosed with completely non-deterministic contents - german
> text, what appeared to be UUEncoded binaries, random data, as well as
> some kind of regular-looking data.  It wasn't like a bunch of the writes
> got crossed and files ended up backwards.  It also wasn't like random
> junk was written.

What you see might be a result of metadata corruption rather than file 
contents corruption. The metadata might be pointing to astray places, which 
are either used or unused-but-previously-written-to places on the drive. It 
may even be that the data from original files is sitting there intact.

As a side note: did you try fsck'ing the filesystem?

Cheers,
Kuba
