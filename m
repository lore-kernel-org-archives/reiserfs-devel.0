From: "S. Alexander Jacobson" <alex@shop.com>
Subject: Re: duplicate files and recent changes
Date: Thu, 6 Jun 2002 03:33:17 -0400 (Eastern Daylight Time)
Message-ID: <Pine.WNT.4.43.0206060328570.1296-100000@fanatic>
References: <20020606094504.A851@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10533-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020606094504.A851@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Thu, 6 Jun 2002, Oleg Drokin wrote:
> On Thu, Jun 06, 2002 at 01:30:46AM -0400, S. Alexander Jacobson wrote:
> > I just joined this list.  Two question:
> > 1. Can reiserfs detect that I have two copies of
> > the same file on disk and store tham as one file
>
> Hm, you mean, each time you create a file, reiserfs should scan all
> other files and see if there is exactly a file like you just wrote?
> Hm, even something more complicated as you are writing to a file in
> 4k chunks.
> Definitely no.

I could imagine a cheaper implementation in which
the fs computes an MD5 hash of each file as it is
being written.  If the hash matches the
pre-existing hash of some other file, then
consolidate.

> > (doing a lazy copy) if someone writes to one of
> > them?
>
> > 2. Is there a fast way to get access to the file
> > change list?  It would be nice to be able to do
> > fast backup of changed files without having to
> > traverse entire directory trees.
>
> No.

I would presume that journalling gives access to
this sort of recent information.  It is really a
question of whether applications may access
the journal and whether the journal format is
opaque.

-Alex-

___________________________________________________________________
S. Alexander Jacobson                   i2x Media
1-212-787-1914 voice                    1-603-288-1280 fax


