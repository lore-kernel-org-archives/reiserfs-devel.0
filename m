From: Domenico Andreoli <cavok@tiscali.it>
Subject: Re: fsck.reiser4 can't fix 1 fixable corruption
Date: Wed, 21 Apr 2004 23:58:22 +0200
Sender: Domenico Andreoli <cavok@libero.it>
Message-ID: <20040421215822.GA26861@raptus.homelinux.org>
References: <200404201733.51809.rmeijer@internet.gr> <4086D603.3010309@xs4all.nl> <20040421205347.GA14939@raptus.homelinux.org> <200404220113.28246.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18140-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200404220113.28246.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Thu, Apr 22, 2004 at 01:13:28AM +0400, Vitaly Fertman wrote:
> On Thursday 22 April 2004 00:53, Domenico Andreoli wrote:
> > On Wed, Apr 21, 2004 at 10:13:55PM +0200, Sander Sweers wrote:
> > > Building reiser4 support is easy, the patch applies cleanly on grub 0.94.
> > > You have to add option --enable-stand-alone for reiser4progs and libaal
> > > before grub + patch will build it.*
> >
> > what is this --enable-stand-alone argument? help messages says "enable
> > stand alone library" but i don't know which library it is talking about.
> 
> this is probably not very clear phasing, it configures the current library 
> (libreiser4 for the reiser4progs package and libaal for the libaal package) 
> in the stand alone mode.

sorry, it's still not clear to me what configuring a library for stand
alone mode means. do exist not stand alone libraries?

what does really change in the libraries? is something related to
reiser4 or to libtool & co?

is it legal for debian to distribute libaal and libreiser4 packages
compiled with this option?

thank you for the answers you will post :)

cheers
domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
