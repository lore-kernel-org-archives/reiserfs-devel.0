From: Domenico Andreoli <cavok@tiscali.it>
Subject: Re: fsck.reiser4 can't fix 1 fixable corruption
Date: Thu, 22 Apr 2004 13:44:59 +0200
Sender: Domenico Andreoli <cavok@libero.it>
Message-ID: <20040422114459.GA19430@raptus.homelinux.org>
References: <200404201733.51809.rmeijer@internet.gr> <200404220113.28246.vitaly@namesys.com> <20040421215822.GA26861@raptus.homelinux.org> <200404221446.21162.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18148-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200404221446.21162.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Thu, Apr 22, 2004 at 02:46:21PM +0400, Vitaly Fertman wrote:
> with --enable-stand-alone you get another 'stand alone' library that 
> includes the minimum of the code needed for programs like grub --
> no librepair, no tree balancing code, no modification code, etc. The
> code is minimised to be used with grub stage1_5. Libaal in stand-alone
> includes simple memory menagement methods (malloc, free) to avoid
> linking to libc -- as it links to no other libraries it is called stand-alone.

thanks, now it's much more clear :)

> > what does really change in the libraries? is something related to
> > reiser4 or to libtool & co?
> >
> > is it legal for debian to distribute libaal and libreiser4 packages
> > compiled with this option?
> 
> yes. Although new changes are tested not in the stand-alone mode
> first, and the stand-alone support may be delayed sometimes.

this is not a problem, more people is able to use it, more will test
it for bugs :) this is the main reason i'm doing this packaging stuff ;)

ok, i'm trying to build packages (always targeted to debian experimental)
with these stand alone libraries. i'm also reading in configure help
message about "--enable-memory-manager". is anything a distribution
could need [to test]?

i admit, i didn't even look in namesys documentation, so feel free to
point me to docs...

thanks again
domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
