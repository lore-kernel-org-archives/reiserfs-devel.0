From: Christer Weinigel <christer@weinigel.se>
Subject: Re: silent semantic changes with reiser4
Date: 08 Sep 2004 00:47:24 +0200
Sender: wingel@zoo.weinigel.se
Message-ID: <m3isapitmr.fsf@zoo.weinigel.se>
References: <200409070206.i8726vrG006493@localhost.localdomain>
	<413D4C18.6090501@slaphack.com> <m3d60yjnt7.fsf@zoo.weinigel.se>
	<413DFF33.9090607@namesys.com> <m3vfepiv7r.fsf@zoo.weinigel.se>
	<Pine.LNX.4.60.0409071528200.10789@dlang.diginsite.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21604-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.60.0409071528200.10789@dlang.diginsite.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Lang <david.lang@digitalinsight.com>
Cc: Christer Weinigel <christer@weinigel.se>, Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Spam <spam@tnonline.net>, Tonnerre <tonnerre@thundrix.ch>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

David Lang <david.lang@digitalinsight.com> writes:

> so far the best answer that I've seen is a slight varient of what Hans
> is proposing for the 'file-as-a-directory'
> 
> make the base file itself be a serialized version of all the streams
> and if you want the 'main' stream open file/. (or some similar
> varient)

> in fact it may make sense to just open file/file to get at the 'main'
> stream of the file (there may be cases where the concept of a single
> main stream may not make sense)

So what happens if I have a text file foo.txt and add an author
attribute to it?  When I read foo.txt the next time it's supposed to
give me a serialized version with both the contents of foo.txt _and_
the author attribute?

That would definitely confuse me.

Or did I misunderstand something?

  /Christer

-- 
"Just how much can I get away with and still go to heaven?"

Freelance consultant specializing in device driver programming for Linux 
Christer Weinigel <christer@weinigel.se>  http://www.weinigel.se
