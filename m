From: Pavel Machek <pavel@ucw.cz>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 23:06:39 +0200
Message-ID: <20040827210638.GE709@openzaurus.ucw.cz>
References: <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org> <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408251348240.17766@ppc970.osdl.org> <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk> <20040826001152.GB23423@mail.shareable.org> <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk> <20040826010049.GA24731@mail.shareable.org> <20040826100530.GA20805@taniwha.stupidest.org> <20040826110258.GC30449@mail.shareable.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20995-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040826110258.GC30449@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Hi!

> > > One of the big potential uses for file-as-directory is to go inside
> > > archive files, ELF files, .iso files and so on in a convenient way.
> > 
> > Arguably this belongs in userspace --- and people have put it there.
> 
> I agree that these belong in userspace, and that there's plenty* of
> userspace code doing a similar thing already.  I don't think there's
> any argument over it.
> 
> However, as far as I know it's not accessible in a file-as-directory
> form as yet.  In my opinion that is the most natural form and it would
> be very intuitive to use.  

It does not work. .deb file is ar archive. It is also debian
package. How do you know if I want to see it as a package or as a archive?
How do you identify file types, anyway?

Same happens for .tar.gz.

uservfs does

cd foo.deb#uar
vs.
cd foo.deb#udeb

and

cd foo.tgz#utar
vs.
cat foo.tgz#ugz


-- 
64 bytes from 195.113.31.123: icmp_seq=28 ttl=51 time=448769.1 ms         

