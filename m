From: Neil Brown <neilb@cse.unsw.edu.au>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 7 Sep 2004 16:43:11 +1000
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <16701.22655.230704.534640@cse.unsw.edu.au>
References: <200408311931.i7VJV8kt028102@laptop11.inf.utfsm.cl>
	<Pine.LNX.4.58.0408311252150.2295@ppc970.osdl.org>
	<20040901194445.GM26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: message from Markus    =?ISO-8859-1?Q?=20T=F6rnqvist?= on Wednesday September 1
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Markus  =?ISO-8859-1?Q?=20T=F6rnqvist?= <mjt@nysv.org>
Cc: Linus Torvalds <torvalds@osdl.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Pavel Machek <pavel@ucw.cz>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Wednesday September 1, mjt@nysv.org wrote:
> On Tue, Aug 31, 2004 at 01:05:40PM -0700, Linus Torvalds wrote:
> >
> >There's no point to having the kernel export information that is already 
> >inherent in the main stream.

Having read this quote a few times in this thread I finally figured
out what was wrong with it.

It seems to imply that "iso9660" shouldn't be in the kernel.  After
all, it just exports information that is already in the underlying
device. 
It doesn't provide any "mediate multiple access" benefit as a
read-only filesystem doesn't require any mediation between users.
It might provide some caching benefit, but I somehow don't think that
is the reason that it is in the kernel.

Now I'm happy to agree that there is a case for "iso9660" but not for
"tarfs", but I don't think it is that "there's no point to having the
kernel export information that is already [there]"

NeilBrown
