From: Sander <sander@humilis.net>
Subject: Re: reiser4 and apache (was: Re: Reiser4 and ZFS)
Date: Tue, 28 Dec 2004 12:12:39 +0100
Message-ID: <20041228111239.GA10511@favonius>
References: <20041215064608.66493.qmail@web50901.mail.yahoo.com> <200412152000.iBFK0CHH016500@turing-police.cc.vt.edu> <20041227122814.GA7388@favonius> <200412271533.iBRFXpmT011625@turing-police.cc.vt.edu>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22920-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200412271533.iBRFXpmT011625@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis.Kletnieks@vt.edu
Cc: reiserfs-list@namesys.com

Valdis.Kletnieks@vt.edu wrote (ao):
> On Mon, 27 Dec 2004 13:28:15 +0100, Sander said:
> > Valdis.Kletnieks@vt.edu wrote (ao):
> > > For many shops, it's quite likely that a ZFS with "more scalability
> > > and administration" is The Right Choice, especially if it does *NOT*
> > > include lots of odd new features and quirks that might break
> > > production code (remember the joys in getting Apache running on
> > > reiser4, until it was discovered that the 'file-as-directory' stuff
> > > broke programs that weren't expecting it?).
> > 
> > I just got bitten by this. Is it possible to get apache to run on
> > reiser4, and if so, how?
> 
> I think the archives have pointers to both a reiser4 patch that disables
> the "file as directory", and a patch to apache to deal with the situation...

I can't find it in the archives, nor with google or on the Namesys
website (namely download, getting started with v4, and the FAQ).

I did find this mail from Hans about the issue and his request for a
patch for apache:
http://www.dragoninc.on.ca/mail-archives/reiserfs/2004-08/0583.html

That thread doesn't contain a patch unfortunately.

Can somebody please point me to a patch to disable the file as a
directory feature?

Hans, would this be something for a mount option? And shouldn't more
info on this be on the website?

Thanks in advance.
