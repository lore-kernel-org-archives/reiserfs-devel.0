From: Christer Weinigel <christer@weinigel.se>
Subject: Re: silent semantic changes with reiser4
Date: 08 Sep 2004 07:48:27 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <m3ekldia50.fsf@zoo.weinigel.se>
References: <200409070206.i8726vrG006493@localhost.localdomain>
	<413D4C18.6090501@slaphack.com> <m3d60yjnt7.fsf@zoo.weinigel.se>
	<1183150024.20040907143346@tnonline.net>
	<413DD5B4.nailC801GI4E2@pluto.uni-freiburg.de>
	<m34qm9kbcl.fsf@zoo.weinigel.se>
	<413E3280.nailEK92X8CU7@pluto.uni-freiburg.de>
	<m3n001its8.fsf@zoo.weinigel.se>
	<413E4836.nailFFM11WGWE@pluto.uni-freiburg.de>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <413E4836.nailFFM11WGWE@pluto.uni-freiburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gunnar Ritter <Gunnar.Ritter@pluto.uni-freiburg.de>
Cc: Christer Weinigel <christer@weinigel.se>, Horst von Brand <vonbrand@inf.utfsm.cl>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Tonnerre <tonnerre@thundrix.ch>, Spam <spam@tnonline.net>, ReiserFS List <reiserfs-list@namesys.com>, Hans Reiser <reiser@namesys.com>, Pavel Machek <pavel@ucw.cz>, David Masover <ninja@slaphack.com>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Jamie Lokier <jamie@shareable.org>, Christoph Hellwig <hch@lst.de>, Alexander Lyamin aka FLX <flx@namesys.com>, Chris Wedgwood <cw@f00f.org>

Gunnar Ritter <Gunnar.Ritter@pluto.uni-freiburg.de> writes:

> Besides, copying xattrs is usually permitted (POSIX.1-2004, XCU cp):
> 
> # If the implementation provides additional or alternate access control
> # mechanisms (see the Base Definitions volume of IEEE Std 1003.1-2001,
> # Section 4.4, File Access Permissions), their effect on copies of files
> # is implementation-defined.

In <413DD5B4.nailC801GI4E2@pluto.uni-freiburg.de> you wrote:

>A POSIX.1-conforming cp implementation would not be allowed to copy
>additional streams, unless either additional options are given or the
>type of the file being copied is other than S_IFREG.

I read this as that POSIX mandates that cp can absolutely not copy
anything else but the file contents.  That is what I called broken.

If we implement named streams as xattrs and that can be accessed with
openat(..., O_XATTR) this means that cp is allowed to copy the xattrs
(well, named streans don't neccesarily have to be "alternate access
control mechanisms", but they can use the same xattr namespace).  

That's quite ok in that case.

  /Christer

-- 
"Just how much can I get away with and still go to heaven?"

Freelance consultant specializing in device driver programming for Linux 
Christer Weinigel <christer@weinigel.se>  http://www.weinigel.se
