From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 07 Sep 2004 11:20:54 -0700
Message-ID: <413DFC06.5070604@namesys.com>
References: <200409070206.i8726vrG006493@localhost.localdomain> <413D4C18.6090501@slaphack.com> <m3d60yjnt7.fsf@zoo.weinigel.se> <413DA8EE.nailA301JQ74H@pluto.uni-freiburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21581-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <413DA8EE.nailA301JQ74H@pluto.uni-freiburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gunnar Ritter <Gunnar.Ritter@pluto.uni-freiburg.de>
Cc: David Masover <ninja@slaphack.com>, Christer Weinigel <christer@weinigel.se>, Horst von Brand <vonbrand@inf.utfsm.cl>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Tonnerre <tonnerre@thundrix.ch>, Spam <spam@tnonline.net>, ReiserFS List <reiserfs-list@namesys.com>, Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Jamie Lokier <jamie@shareable.org>, Christoph Hellwig <hch@lst.de>, Alexander Lyamin aka FLX <flx@namesys.com>, Chris Wedgwood <cw@f00f.org>

Gunnar Ritter wrote:

>
>
>You cannot just 'modify cp'. 
>
People who think that POSIX is the objective rather than the least 
common denominator of OS design have had their head screwed on backwards 
to better look at where their competitors used to be.

However, I agree that streams suck.  That is why reiser4 just has files 
and directories and not streams.  Our files and directories just happen 
to be able to do all that streams can do.

Hans
