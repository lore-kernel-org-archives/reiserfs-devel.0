From: Gunnar Ritter <Gunnar.Ritter@pluto.uni-freiburg.de>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 08 Sep 2004 01:14:25 +0200
Message-ID: <413E40D1.nailFBI11XFML@pluto.uni-freiburg.de>
References: <200409070206.i8726vrG006493@localhost.localdomain>
 <413D4C18.6090501@slaphack.com> <m3d60yjnt7.fsf@zoo.weinigel.se>
 <413DFF33.9090607@namesys.com> <m3vfepiv7r.fsf@zoo.weinigel.se>
 <Pine.LNX.4.60.0409071528200.10789@dlang.diginsite.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21606-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.60.0409071528200.10789@dlang.diginsite.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Lang <david.lang@digitalinsight.com>, Christer Weinigel <christer@weinigel.se>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Tonnerre <tonnerre@thundrix.ch>, Spam <spam@tnonline.net>, ReiserFS List <reiserfs-list@namesys.com>, Hans Reiser <reiser@namesys.com>, Pavel Machek <pavel@ucw.cz>, David Masover <ninja@slaphack.com>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Jamie Lokier <jamie@shareable.org>, Christoph Hellwig <hch@lst.de>, Alexander Lyamin aka FLX <flx@namesys.com>, Chris Wedgwood <cw@f00f.org>

David Lang <david.lang@digitalinsight.com> wrote:

> so far the best answer that I've seen is a slight varient of what Hans is 
> proposing for the 'file-as-a-directory'
>
> make the base file itself be a serialized version of all the streams and 
> if you want the 'main' stream open file/. (or some similar varient)

As has been said previously, all such proposals except for those
with two leading slashes would directly violate POSIX.1-2004, Base
Definitions, 4.11 'Pathname Resolution'. In particular,

# A pathname that contains at least one non-slash character and that
# ends with one or more trailing slashes shall be resolved as if a
# single dot character ( '.' ) were appended to the pathname.

A regular file name with special semantics, in contrast, would not
violate POSIX, in particular if a stat() on it would not return one
of the standard S_IFXXX types. Inappropriate operations could just
fail with EINVAL on such files, and it would be unspecified by the
standard how they were handled by 'cp' or other standardized utilities.

Having a separate S_IFXXX type for streamed files would also give
attention to portability issues easily. It might in fact be better
to have existing applications fail explicitly with them than to
make this as transparent as possible, but hope for good luck.

Utilities like 'tar' would just say 'Unknown file type' or the like
and exclude such files from the archives they create. This would lead
the user's explicit attention to the data loss. He might then choose
to ignore the error, or to get a special version of 'tar' to handle it.

It would also be clear to programmers and users that such files are
special things they don't normally need. Regular Linux installations
might totally ignore them. If streamed files are only intended for
use with CIFS or other special cases, that might be a more clean
solution for this issue than watering down the existing portable
file semantics.

	Gunnar
