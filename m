From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: Agressive selective pre-allocation
Date: Thu, 12 Dec 2002 09:47:54 +0100
Message-ID: <20021212094754.S26400@vestdata.no>
References: <20021210074600.J26400@vestdata.no> <200212100826.36651.russell@coker.com.au> <20021210111228.GA9155@shuttle.mothership.home.dhs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12153-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021210111228.GA9155@shuttle.mothership.home.dhs.org>; from stefan.fleiter@web.de on Tue, Dec 10, 2002 at 12:12:28PM +0100
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Tue, Dec 10, 2002 at 12:12:28PM +0100, Stefan Fleiter wrote:
> > mbox's aren't an issue, if you have them then you probably don't care t=
oo
> > much about performance anyway.
>=20
> I switched some large mailing lists with thousands of messages from mbox =
to
> maildir with mutt. Changing mailboxes lasted maybe 2 or 3 times longer,
> so I switched back to mbox *for speed*.

Yes, maildir is not always faster.

First problem is disk-layout. The way it works with reiserfs3.6 and
default hashes the inodes and files are written in different orders and
the disk does a lot of unneeded seeks. A workaround is to use a hash
that automagicly orders inodes and files the same way. A better way is
probably to store the stat-data with the directory-data. I think that is
on the schedule, is it not?

It is also important that readdir-order matches the ondisk layout, but
that is perhaps already the case?

Possible the overhead of the systemcalls is also significant, but my
guess is that it is negletable compared to io-performance.

Next problem is readahead. When the whole mailbox is in a single file
the OS is able to use readahead to improve performance, but it doesn't
seem to work as well when reading a whole directory. This is perhaps the
thoughest one to solve, IMHO.


However, the single most important fix would be the mail-clients. If I'm
not mistaken mutt reads the whole mail, and that's simply not required.
It should only read the headers. That will speed things up by a huge
factor when you have mails with attachments and so on.  It must also learn =

that it shouldn't reread the folder everytime it's updated!

Right now the case is pretty much that none or few of the potential
performance-benefits of maildir are made use of, and the drawbacks are
hitting much harder then they ought to. I bet it's only temporary
though. Reiserfs has the potential to make faster mailsystems with
the use of maildir! :-)



--=20
Ragnar Kj=F8rstad
