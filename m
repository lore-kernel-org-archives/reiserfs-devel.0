From: Sander Sweers <sandersweers@xs4all.nl>
Subject: Re: fsck.reiser4 can't fix 1 fixable corruption
Date: Wed, 21 Apr 2004 21:30:07 +0200
Message-ID: <4086CBBF.8010406@xs4all.nl>
References: <200404201733.51809.rmeijer@internet.gr>    <200404211259.01802.rmeijer@internet.gr>    <200404211547.08993.vitaly@namesys.com>    <200404211509.20290.rmeijer@internet.gr> <13790.212.0.249.130.1082549980.squirrel@webmail.xs4all.nl>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090400080802090609010504"
Return-path: <reiserfs-list-return-18132-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <13790.212.0.249.130.1082549980.squirrel@webmail.xs4all.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------090400080802090609010504
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Sander Sweers wrote:

><citaat van="Raymond A. Meijer">
>  
>
>>On Wed 21 April 2004 14:51, Vitaly Fertman wrote:
>>
>>    
>>
>>>>No luck... :(
>>>>        
>>>>
>>>ok, that patch avoids such problems if you have not fsck'ed yet.
>>>      
>>>
>>Aha! :)
>>
>>    
>>
>>>I have put another internal reiser4progs snapshot with some more
>>>fixes into the www.namesys.com/snapshots/2004.04.21-internal.testing/
>>>I have no problems with it, try it please.
>>>      
>>>
>>Alright, downloading it now...I'll let you know what happens.
>>
>>
>>Thanks,
>>
>>Ray
>>
>>    
>>
>
>I'l try the new reiser4progs tonight when i'm home.
>
>Sander
>
>
>  
>
The new reiser4progs fixed the problem :)

I also attached 2 modified gentoo ebuilds for those who want them.
Is it ok if I post them to bugs.gentoo.org so other gentooist can enjoys 
the new versions?

NOTE: the ebuilds have /--enable-stand-alone/ to have grub build reiser4 
support.

Thanks
Sander



--------------090400080802090609010504
Content-Type: text/plain;
 name="libaal-0.5.1.ebuild"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libaal-0.5.1.ebuild"

# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/cvsroot/gentoo-x86/sys-libs/libaal/libaal-0.5.0-r1ebuild,v 1.1 2004/02/06 14:12:24 vapier Exp $

DESCRIPTION="libaal library required by reiser4progs"
HOMEPAGE="http://www.namesys.com/v4/v4.html"
SRC_URI="http://thebsh.namesys.com/snapshots/2004.04.21-internal.testing.fixed/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"

DEPEND=""

src_compile() {
	econf --libdir=/lib --enable-stand-alone || die "configure failed"
	emake || die "make failed"
}

src_install() {
	make DESTDIR=${D} install || die
	dodir /usr/lib
	mv ${D}/lib/libaal.{a,la} ${D}/usr/lib/
	dodoc AUTHORS BUGS CREDITS ChangeLog NEWS README THANKS TODO
}

--------------090400080802090609010504
Content-Type: text/plain;
 name="reiser4progs-0.5.4.ebuild"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4progs-0.5.4.ebuild"

# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/cvsroot/gentoo-x86/sys-fs/reiser4progs/reiser4progs-0.5.3.ebuild,v 1.3 2004/04/12 12:14:46 lv Exp $

DESCRIPTION="reiser4progs: mkfs, fsck, etc..."
HOMEPAGE="http://www.namesys.com/v4/v4.html"
SRC_URI="http://thebsh.namesys.com/snapshots/2004.04.21-internal.testing.fixed/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~ppc ~amd64"

DEPEND=">=sys-libs/libaal-0.5.1"

src_compile() {
	econf --sbindir=/sbin --libdir=/lib --enable-stand-alone || die "configure failed"
	emake || die "make failed"
}

src_install() {
	make DESTDIR=${D} install || die
	dodir /usr/lib
	mv ${D}/lib/lib{reiser4,repair}.{a,la} ${D}/usr/lib/
	dodoc AUTHORS BUGS CREDITS ChangeLog NEWS README THANKS TODO
}

--------------090400080802090609010504--
