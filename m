From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 10 Sep 2004 13:50:05 -0400
Message-ID: <200409101750.i8AHo5qx005157@localhost.localdomain>
References: <wscott@bitmover.com>
Return-path: <reiserfs-list-return-21684-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Wayne Scott <wscott@bitmover.com> 
   of "Fri, 10 Sep 2004 10:50:40 EST." <20040910.105040.30177815.wscott@bitmover.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wayne Scott <wscott@bitmover.com>
Cc: miller@techsource.com, reiser@namesys.com, Peter.Foldiak@st-andrews.ac.uk, jamie@shareable.org, bunk@fs.tum.de, viro@parcelfarce.linux.theplanet.co.uk, torvalds@osdl.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Timothy Miller <miller@techsource.com> said:
> > Everyone likes ':', so we'd have "problem/shoe:size".  (Don't bother to 
> > complain about files which have : in them, because I already know it 
> > sucks, but it's an example.)
> 
> [[ I just joined this discussion, so pardon if this is already known.]]

> One advantage of ':' is that portable programs already have to avoid
> it because of NTFS alternate data streams:

Portable programs working on POSIX don't give a damn that C:, CON:, etc are
reserved in MS-DOS.

Windows warts shouldn't infect Linux.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
