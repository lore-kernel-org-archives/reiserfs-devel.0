From: Christer Weinigel <christer@weinigel.se>
Subject: Re: silent semantic changes with reiser4
Date: 07 Sep 2004 23:41:02 +0200
Sender: wingel@zoo.weinigel.se
Message-ID: <m3zn41iwpd.fsf@zoo.weinigel.se>
References: <200409070206.i8726vrG006493@localhost.localdomain>
	<413D4C18.6090501@slaphack.com> <m3d60yjnt7.fsf@zoo.weinigel.se>
	<1183150024.20040907143346@tnonline.net>
	<m38ybmjiyz.fsf@zoo.weinigel.se> <413DF9D2.5060703@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21594-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <413DF9D2.5060703@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Tonnerre <tonnerre@thundrix.ch>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser <reiser@namesys.com> writes:

> Christer Weinigel wrote:
> 
> >Spam <spam@tnonline.net> writes:
> >
> >
> >>> Additionally, files-as-directores does not solve the problem of
> >>> "cp a b" losing named streams.
> >>>
> reiser4 does not support streams, it supports files that can do what
> streams do. cp -r does not currently lose files.

I'm not talking about reiser4 only.  I'm interested in semantics that
can be sanely apply to reiser4, NTFS, HFS, or any other file system
that supports XATTRS.

I relize that resier4 is your baby and you're only interested in it,
but I'm much more interested in linux in general.

  /Christer


-- 
"Just how much can I get away with and still go to heaven?"

Freelance consultant specializing in device driver programming for Linux 
Christer Weinigel <christer@weinigel.se>  http://www.weinigel.se
