From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [ANNOUNCE]: reiser4
Date: Wed, 30 Oct 2002 19:29:32 +0300
Message-ID: <15808.2284.23607.625639@laputa.namesys.com>
References: <15806.51536.985203.709475@laputa.namesys.com>
	<3DBED1C8.5080404@pobox.com>
	<15806.54736.737949.328809@laputa.namesys.com>
	<20021030162200.GD1995@louise.pinerecords.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11840-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021030162200.GD1995@louise.pinerecords.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tomas Szepe <szepe@pinerecords.com>
Cc: Jeff Garzik <jgarzik@pobox.com>, Linux Kernel Mailing List <Linux-Kernel@vger.kernel.org>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Tomas Szepe writes:
 > >  > Nikita Danilov wrote:
 > >  > 
 > >  > >Hello,
 > >  > >
 > >  > >Snapshot of reiser4 source code can be found at 
 > >  > >http://www.namesys.com/snapshots/2002.10.29/.
 > >  > >
 > >  > >It is set of patches against current Linus BK tree (2.5.44).
 > >  > >  
 > >  > >
 > >  > 
 > >  > The current Linus BK tree is quite a bit different from 2.5.44 ;-)
 > >  > 
 > >  > Take a look at 2.5.44-bk1 at 
 > >  > ftp://ftp.kernel.org/pub/linux/kernel/v2.5/snapshots/
 > >  > 
 > >  > A -bk2 snapshot should appear within the hour, too, with heaps of 
 > >  > additional changes.
 > >  > 
 > > 
 > > Sorry, my fault.
 > > 
 > > Patches in reiser4 snapshot are against Linus BK repository at
 > > http://linux.bkbits.net/linux-2.5. Numbers 2, 5, and 44, are, of course,
 > > just VERSION, PATCHLEVEL, and SUBLEVEL in the Makefile of the said
 > > repository.
 > 
 > The following is needed to compile reiser4 in 2.5.44-bk3:

Thanks a lot.

 > 
 > diff -urN linux-2.5.44-bk3-reiser4/mm/Makefile linux-2.5.44-bk3-reiser4.1/mm/Makefile
 > --- linux-2.5.44-bk3-reiser4/mm/Makefile	2002-10-12 13:35:03.000000000 +0200
 > +++ linux-2.5.44-bk3-reiser4.1/mm/Makefile	2002-10-30 17:15:10.000000000 +0100
 > @@ -2,7 +2,7 @@
 >  # Makefile for the linux memory manager.
 >  #
 >  

Nikita.
