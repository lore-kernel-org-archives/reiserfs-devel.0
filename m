From: Gunnar Ritter <Gunnar.Ritter@pluto.uni-freiburg.de>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 08 Sep 2004 08:29:54 +0200
Message-ID: <413EA6E2.nail9U1WWJQS@pluto.uni-freiburg.de>
References: <200409070206.i8726vrG006493@localhost.localdomain>
 <413D4C18.6090501@slaphack.com> <m3d60yjnt7.fsf@zoo.weinigel.se>
 <1183150024.20040907143346@tnonline.net>
 <413DD5B4.nailC801GI4E2@pluto.uni-freiburg.de>
 <m34qm9kbcl.fsf@zoo.weinigel.se>
 <413E3280.nailEK92X8CU7@pluto.uni-freiburg.de>
 <m3n001its8.fsf@zoo.weinigel.se>
 <413E4836.nailFFM11WGWE@pluto.uni-freiburg.de>
 <m3ekldia50.fsf@zoo.weinigel.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21619-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3ekldia50.fsf@zoo.weinigel.se>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christer Weinigel <christer@weinigel.se>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Tonnerre <tonnerre@thundrix.ch>, Spam <spam@tnonline.net>, ReiserFS List <reiserfs-list@namesys.com>, Hans Reiser <reiser@namesys.com>, Pavel Machek <pavel@ucw.cz>, David Masover <ninja@slaphack.com>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Jamie Lokier <jamie@shareable.org>, Christoph Hellwig <hch@lst.de>, Alexander Lyamin aka FLX <flx@namesys.com>, Chris Wedgwood <cw@f00f.org>, Christer Weinigel <christer@weinigel.se>

Christer Weinigel <christer@weinigel.se> wrote:

> Gunnar Ritter <Gunnar.Ritter@pluto.uni-freiburg.de> writes:
>
> > Besides, copying xattrs is usually permitted (POSIX.1-2004, XCU cp):
> > 
> > # If the implementation provides additional or alternate access control
> > # mechanisms (see the Base Definitions volume of IEEE Std 1003.1-2001,
> > # Section 4.4, File Access Permissions), their effect on copies of files
> > # is implementation-defined.
>
> In <413DD5B4.nailC801GI4E2@pluto.uni-freiburg.de> you wrote:
>
> >A POSIX.1-conforming cp implementation would not be allowed to copy
> >additional streams, unless either additional options are given or the
> >type of the file being copied is other than S_IFREG.
>
> I read this as that POSIX mandates that cp can absolutely not copy
> anything else but the file contents.  That is what I called broken.

It would be really helpful if you read the specification before you
comment on it or try to interpret my wording further.

> If we implement named streams as xattrs and that can be accessed with
> openat(..., O_XATTR) this means that cp is allowed to copy the xattrs

No. Not if the file type of such beasts remains S_IFREG.

> (well, named streans don't neccesarily have to be "alternate access
> control mechanisms", but they can use the same xattr namespace).  

POSIX does not know anything about the 'xattr namespace'. It just
allows 'additional or alternate access control mechanisms'. Which
are, in turn, well-defined terms in the standard again. You can
read about them too <http://www.unix.org/version3/>.

	Gunnar
