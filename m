From: "S. Alexander Jacobson" <alex@shop.com>
Subject: Re: duplicate files and recent changes
Date: Thu, 6 Jun 2002 03:40:46 -0400 (Eastern Daylight Time)
Message-ID: <Pine.WNT.4.43.0206060333540.1296-100000@fanatic>
References: <Pine.LNX.4.44.0206061717240.3546-100000@avon.timetraveller.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10534-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <Pine.LNX.4.44.0206061717240.3546-100000@avon.timetraveller.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Brockway <robert@timetraveller.org>
Cc: reiserfs-list@namesys.com

On Thu, 6 Jun 2002, Robert Brockway wrote:
> > On Thu, Jun 06, 2002 at 01:30:46AM -0400, S. Alexander Jacobson wrote:
> > > I just joined this list.  Two question:
> > > 1. Can reiserfs detect that I have two copies of
> > > the same file on disk and store tham as one file
> >
> > Hm, you mean, each time you create a file, reiserfs should scan all
> > other files and see if there is exactly a file like you just wrote?
> > Hm, even something more complicated as you are writing to a file in
> > 4k chunks.
> > Definitely no.
>
> And besides, how could it even know whether you even want them to be the
> same or not.  I keen plenty of identical files around (online backups,
> etc) and I'd be mighty upset if the filesystem started hard linking them
> together :)

That is why I said lazy copy on write.  One
implementation would be for the file system to
keep a ref count of how many different files the
user intended.  When an applicatiion writes to a
file, the file system checks the ref count.  If
the ref count is greater than 1, the file system
copies the file, decrements the ref-count, and
gives the writing application a pointer to the new
copy.

I'm sure there are smarter implementations, but
the point is that the file system can certainly
differentiate in theory between user hard links
and actual hard links.

-Alex-

___________________________________________________________________
S. Alexander Jacobson                   i2x Media
1-212-787-1914 voice                    1-603-288-1280 fax


