From: Domenico Andreoli <cavok@tiscali.it>
Subject: Re: fsck.reiser4 can't fix 1 fixable corruption
Date: Fri, 23 Apr 2004 03:22:24 +0200
Sender: Domenico Andreoli <cavok@libero.it>
Message-ID: <20040423012224.GA18666@raptus.homelinux.org>
References: <200404201733.51809.rmeijer@internet.gr> <200404211259.01802.rmeijer@internet.gr> <200404211547.08993.vitaly@namesys.com> <200404211509.20290.rmeijer@internet.gr> <13790.212.0.249.130.1082549980.squirrel@webmail.xs4all.nl> <4086CBBF.8010406@xs4all.nl> <20040421194414.GB6215@raptus.homelinux.org> <40880F5C.6080207@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18168-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40880F5C.6080207@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Thu, Apr 22, 2004 at 11:30:52AM -0700, Hans Reiser wrote:
> Domenico Andreoli wrote:
> 
> >how hard is to have reiser4 support built in grub?
>
> Yury told me it was done....  Yury....

FYI, i had to enable also libaal memomry manager (configure option
--enable-memory-manager) to build the right stand alone library for grub
reiser4 stage1.5, without it linker complains on missing malloc and free.

updated libaal and reiser4progs packages together with a reiser4 enabled
grub package are available at http://people.debian.org/~cavok/reiser4/.

hmmm... btw, i've never been able to use a stage1.5, any hint?

cheers
domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
