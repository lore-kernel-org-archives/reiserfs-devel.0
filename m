From: David Weinehall <tao@acc.umu.se>
Subject: Re: reiser4 plugins
Date: Thu, 30 Jun 2005 19:10:57 +0200
Message-ID: <20050630171057.GT16867@khan.acc.umu.se>
References: <hubert@uhoreg.ca> <200506290509.j5T595I6010576@laptop11.inf.utfsm.cl> <87hdfgvqvl.fsf@evinrude.uhoreg.ca> <8783be6605062914341bcff7cb@mail.gmail.com> <42C3615A.9020600@namesys.com> <871x6kv4zd.fsf@evinrude.uhoreg.ca> <20050630062956.GP16867@khan.acc.umu.se> <87psu3vnvc.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24847-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <87psu3vnvc.fsf@evinrude.uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hubert Chan <hubert@uhoreg.ca>
Cc: Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Thu, Jun 30, 2005 at 11:57:27AM -0400, Hubert Chan wrote:
> On Thu, 30 Jun 2005 08:29:56 +0200, David Weinehall <tao@acc.umu.se> said:
> 
> > On Thu, Jun 30, 2005 at 12:33:10AM -0400, Hubert Chan wrote:
> >> It's sort of like the way web servers handle index.html, for those
> >> who think it's a stupid idea.  (Of course, some people may still
> >> think it's a stupid idea... ;-) )
> 
> > And guess what?  That's handled on the web server level (userland),
> > not by the file system.  So different web servers can handle it
> > differently (think index.html.sv, index.html.zh, index.php, etc).
> 
> >From the web *browser*'s point of view, it is handled by the
> "filesystem" (which is provided by the various servers).  The browser
> doesn't care how or where the data is stored.  It just requests a file,
> and gets some data back.  So the browser doesn't have to check for
> http://www.example.com/, get a failure (trying to read a directory),
> check for http://www.example.com/index.html, etc.  In this way, the web
> server controls (which I think takes the place of the filesystem in this
> case) what gets shown (index.html.sv, etc.), instead of the leaving it
> up to the browser.
> 
> In the same way, you don't want every single user program to have to
> guess whether it should look at .data, or .contents, or whatever.

For the analogy to be complete:

User has a file browser (say Nautilus)
The file browser sees the userland VFS (say a unified VFS between GNOME
and KDE)
The VFS sees the real file system

This way the userland VFS can be ported to almost any platform.

When toying around on the desktop, an abstraction of what a file
is works fine with me.  When doing serious work (programming,
tar:ing up stuff, etc) I want to be bloody sure that I see the
files in the same way always.  I don't want surprises such as
files suddenly behaving as directories or vice versa.


Regards: David
-- 
 /) David Weinehall <tao@acc.umu.se> /) Northern lights wander      (\
//  Maintainer of the v2.0 kernel   //  Dance across the winter sky //
\)  http://www.acc.umu.se/~tao/    (/   Full colour fire           (/
