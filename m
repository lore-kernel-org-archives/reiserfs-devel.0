From: Chris Mason <mason@suse.com>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 16:51:49 -0400
Message-ID: <1093467108.21878.240.camel@watt.suse.com>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
	 <20040825200859.GA16345@lst.de>
	 <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org>
	 <412CF96A.5040503@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20520-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412CF96A.5040503@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>, Nikita Danilov <Nikita@namesys.com>

On Wed, 2004-08-25 at 16:41, Hans Reiser wrote:
> I just want to add that I AM capable of working with the other 
> filesystem developers in a team-player way, and I am happy to cooperate 
> with making portions more reusable where there is serious interest from 
> other filesystems in that, 

Prove it.  Stop replying for today and come back tomorrow with some
useful discussions.  Christoph suggested that some of the v4 semantics
belong in the VFS and therefore linux as a whole.  He's helping you to
make sure the semantics and fit nicely with the rest of kernel
interfaces and are race free.

Take him up on the offer.

-chris


