From: Tierra <etierra@gmail.com>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 18:01:44 -0600
Message-ID: <c7ef32a704082517012aca6061@mail.gmail.com>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825152805.45a1ce64.akpm@osdl.org> <112698263.20040826005146@tnonline.net> <Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org> <1453698131.20040826011935@tnonline.net> <20040825163225.4441cfdd.akpm@osdl.org> <20040825233739.GP10907@legion.cup.hp.com> <20040825234629.GF2612@wiggy.net>
Reply-To: Tierra <etierra@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20544-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040825234629.GF2612@wiggy.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Wichert Akkerman <wichert@wiggy.net>, ReiserFS <reiserfs-list@namesys.com>

On Thu, 26 Aug 2004 01:46:29 +0200, Wichert Akkerman <wichert@wiggy.net> wrote:
> Previously Jeremy Allison wrote:
> > Multiple-data-stream files are something we should offer, definately (IMHO).
> > I don't care how we do it, but I know it's something we need as application
> > developers.
> 
> Aside from samba, is there any other application that has a use for
> them?
> 
> Wichert.
> 
> --
> Wichert Akkerman <wichert@wiggy.net>    It is simple to make things.
> http://www.wiggy.net/                   It is hard to make things simple.
> 

It's not so much about samba having a use for them as it is about
other applications using them between platforms in the same way. I'm
glad to see Jeremy is on top of this because it's not something I had
even thought about having available on the linux platform in the sense
that my work deals with data streams on NTFS, HFS, and whatever other
filesystems join the venture.

NTFS had very poor support for them for a long time. At one point I
was convinced it was going to be taken out eventually, but SP2 just
showed with even better support for them, and more MS software has
started using them. They can't turn around at this point and take them
out, so they must be planning on using them to a wider extent.

Bryan
