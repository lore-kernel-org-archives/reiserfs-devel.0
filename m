From: Robin Rosenberg <robin.rosenberg.lists@dewire.com>
Subject: Re: The argument for fs assistance in handling archives
Date: Thu, 2 Sep 2004 09:55:57 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <200409020955.57286.robin.rosenberg.lists@dewire.com>
References: <20040826150202.GE5733@mail.shareable.org> <Pine.LNX.4.58.0409012259340.2295@ppc970.osdl.org> <4136C876.5010806@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <4136C876.5010806@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Linus Torvalds <torvalds@osdl.org>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thursday 02 September 2004 09.15, Hans Reiser wrote:
> Linus Torvalds wrote:
> >. Doing transactions on one file is
> >only the beginning - you'll find people who want transactions across file
> >boundaries etc.
>
> Yup, that's what reiser4 is aiming at and where things get exciting for
> version control systems and the like.  We are just missing the api code
> for it at the moment, all the infrastructure is there, and the api is in
> progress in sys_reiser4.

Hope that is the same as or implied XA-support. Having to syncrhonized file 
updates with database transactions is not an uncommon problem. 

-- robin
