From: Brad Boyer <flar@allandria.com>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 22:42:21 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040830054221.GA30247@pants.nu>
References: <4132205A.9080505@namesys.com> <20040829183629.GP21964@parcelfarce.linux.theplanet.co.uk> <20040829185744.GQ21964@parcelfarce.linux.theplanet.co.uk> <41323751.5000607@namesys.com> <20040829212700.GA16297@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408291431070.2295@ppc970.osdl.org> <1093821430.8099.49.camel@lade.trondhjem.org> <Pine.LNX.4.58.0408291641070.2295@ppc970.osdl.org> <1093830135.8099.181.camel@lade.trondhjem.org> <Pine.LNX.4.58.0408291919450.2295@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0408291919450.2295@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: Trond Myklebust <trond.myklebust@fys.uio.no>, Alexander Viro <viro@parcelfarce.linux.theplanet.co.uk>, Hans Reiser <reiser@namesys.com>, flx@msu.ru, Paul Jackson <pj@sgi.com>, riel@redhat.com, ninja@slaphack.com, diegocg@teleline.es, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, hch@lst.de, Linux Filesystem Development <linux-fsdevel@vger.kernel.org>, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Sun, Aug 29, 2004 at 07:31:49PM -0700, Linus Torvalds wrote:
> On Sun, 29 Aug 2004, Trond Myklebust wrote:
> > >  - how to actually test this out in practice (ie getting reiser4 to do the
> > >    proper thing wrt the VFS layer, but preferably _also_ having another
> > >    filesystem like NFSv4 or cifs that actually uses this and shows what
> > >    the problems are).
> > 
> > As I said, NFSv4 can be made ready pretty quickly: Bruce is already
> > finishing up the xattr implementation.
> 
> Do we have any servers that implement it? I think NFSv4 might be a good 
> test-case if so.

I know the mention of it in the past has brought up ridicule, but
netatalk requires some level of multi-stream support in the export
to the client, and currently just emulates it on the server side
by hiding the extra files in various directories. It should be
possible to modify it to use named streams/attributes for the
extra data. If that happens, it would be nice if hfs and hfsplus
could export the data so it could be used. The view exported by
netatalk does match the internal structure of hfs, after all.

(For those of you that aren't familiar with the Macintosh, a Mac
style filesystem has two peer streams, data and resource. They
are each a seekable bytestream, and are actually at the same
level inside the filesystem. In addition, there is a large set
of fixed length attributes stored, such as the file type info
and icon position. In addition, hfsplus also supports full
named streams and arbitrary metadata, tho that isn't used much.)

	Brad Boyer
	flar@allandria.com

