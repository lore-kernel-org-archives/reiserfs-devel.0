From: David Weinehall <tao@acc.umu.se>
Subject: Re: reiser4 plugins
Date: Mon, 27 Jun 2005 15:47:52 +0200
Message-ID: <20050627134752.GE16867@khan.acc.umu.se>
References: <200506270040.j5R0eUNA030632@turing-police.cc.vt.edu> <42BF667C.50606@slaphack.com> <200506270423.j5R4Np9n004510@turing-police.cc.vt.edu> <42BF8F42.7030308@slaphack.com> <200506270541.j5R5fULX007282@turing-police.cc.vt.edu> <42BF9562.4090602@slaphack.com> <200506270612.j5R6CZGX008462@turing-police.cc.vt.edu> <42BF9C4D.3080800@slaphack.com> <200506270643.j5R6hqRh009781@turing-police.cc.vt.edu> <42BFA421.70506@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24699-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <42BFA421.70506@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Mon, Jun 27, 2005 at 02:00:49AM -0500, David Masover wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Valdis.Kletnieks@vt.edu wrote:
> > On Mon, 27 Jun 2005 01:27:25 CDT, David Masover said:
> 
> [...]
> 
> >>Speaking of backup, that's another nice place for a plugin.  Imagine a
> >>dump that didn't have to be of the entire FS, but rather an arbitrary
> >>tree...  That might be a nice new archive format.  I know Apple already
> >>uses something like this for their dmg packages.
> > 
> > 
> > Hmm.. you mean like 'tar' or 'cpio' or 'pax' or 'rsync'? :) 
> 
> No, a dmg is an OS X program installer.  It appears to be a disk image
> of sorts.  So this is the backup idea in reverse.

Yeah, disk images are really a new invention...  It's not like creating
an arbitrarily large solid file and then doing mkfs on it would
accomplish the same thing =)

> They even "optimize" (repack? defrag?) the hard drive after each update.

That's what they call the updating of the prelinking information,
AFAIK.


Regards: David Weinehall
-- 
 /) David Weinehall <tao@acc.umu.se> /) Northern lights wander      (\
//  Maintainer of the v2.0 kernel   //  Dance across the winter sky //
\)  http://www.acc.umu.se/~tao/    (/   Full colour fire           (/
