From: Helge Hafting <helgehaf@aitel.hist.no>
Subject: Re: silent semantic changes with reiser4
Date: Sat, 28 Aug 2004 19:05:15 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040828170515.GB24868@hh.idb.hist.no>
References: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com> <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Rik van Riel <riel@redhat.com>, Spam <spam@tnonline.net>, Jamie Lokier <jamie@shareable.org>, Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com, Al Viro <viro@parcelfarce.linux.theplanet.co.uk>

On Fri, Aug 27, 2004 at 07:05:35PM -0700, Linus Torvalds wrote:
>=20
>=20
> On Fri, 27 Aug 2004, Rik van Riel wrote:
> >=20
> > Thing is, there is no way to distinguish between what are
> > virtual files and what are actual streams hidden inside a
> > file.  You don't know what should and shouldn't be backed
> > up...
>=20
> I think that lack of distinguishing poiwer is more serious for=20
> directories. The more I think I think about it, the more I wonder whe=
ther=20
> Solaris did things right - having a special operation to "cross the=20
> boundary".
>=20
> I suspect Solaris did it that way because it's a hell of a lot easier=
 to=20
> do it like that, but regardless, it would solve the issue of real=20
> directories having both real children _and_ the "extra streams".

There are many ways of doing this. Several extra streams to a directory
that aren't ordinary files in the directory?

It seems to me that we can get a lot of nice functionality in a simpler=
 way:
Instead of thinking about a number of streams attached to something
that is either an ordinary file or directory, just say that the only
change will be that a directory may have a _single_ file stream in
addition to being a plain directory.

The conceptual change is smaller.  Still you achieve multiple
streams, the "main" stream in such a dir+file is the single stream
attached to the directory.  All the "extra streams" are files inside th=
e=20
(normal) directory.

* This way, the extra streams aren't "special" in any way and
  should work fine with existing tools.=20
* Serving such a filesystem to clients that use multiple streams
  will allow any number of streams per file for them
* Moving the directory+file thing will move both the directory and
  the special stream, and all the extra streams follow because they're
  =EF=BF=BDpart of the directory as usual=EF=BF=BD.

If the VFS is to be extended in order to support file-as-directory (or
vice versa) then hopefully it can be done in a simple way.

Helge Hafting
=20
-
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
