From: Robert Brockway <robert@timetraveller.org>
Subject: Re: duplicate files and recent changes
Date: Thu, 6 Jun 2002 17:20:21 +1000 (EST)
Message-ID: <Pine.LNX.4.44.0206061717240.3546-100000@avon.timetraveller.org>
References: <20020606094504.A851@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10532-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020606094504.A851@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Thu, 6 Jun 2002, Oleg Drokin wrote:

> Hello!
> 
> 
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

And besides, how could it even know whether you even want them to be the
same or not.  I keen plenty of identical files around (online backups,
etc) and I'd be mighty upset if the filesystem started hard linking them
together :)

Rob

-- Robert Brockway B.Sc. email: robert@timetraveller.org  ICQ: 104781119
   Linux counter project ID #16440 (http://counter.li.org)
   "The earth is but one country and mankind its citizens" -Baha'u'llah

