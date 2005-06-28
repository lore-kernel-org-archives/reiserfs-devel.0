From: Christoph Hellwig <hch@infradead.org>
Subject: Re: reiser4 merging action list
Date: Tue, 28 Jun 2005 10:41:21 +0100
Message-ID: <20050628094121.GA16074@infradead.org>
References: <42BB7B32.4010100@slaphack.com> <200506240334.j5O3YowB008100@laptop11.inf.utfsm.cl> <20050627092138.GD11013@nysv.org> <20050627124255.GB6280@thunk.org> <42C0578F.7030608@namesys.com> <20050627212628.GB27805@thunk.org> <42C084F1.70607@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24752-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <42C084F1.70607@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Markus T?rnqvist <mjt@nysv.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, David Masover <ninja@slaphack.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Jeff Garzik <jgarzik@pobox.com>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Steve Lord <lord@xfs.org>

On Mon, Jun 27, 2005 at 04:00:01PM -0700, Hans Reiser wrote:
> 
> Andrew asked me to put together a list of things that need to be done
> before merging:

...

> Probably I forget something.

I've started to do a very basic look over the tree and there's a few
more things that spring to mind:

 - cpp abuse.  There's quite a lot of really odd macros - the typesafe_list,
   typesafe_hash stuff is mentioned already, but there's really horrible
   stuff like _INIT_ and _DONE_ bits in init_super.c, and the wrappers for
   plugin method invocations.
 - endianess handling.  The d* types are a lovely attempt to make sure
   you're not missing endianess conversions.  We have a more general
   way to ensure that now using sparse, that's the __le* / __be* types.
   Try running sparse -Wbitwise to find places you'll need that annotations
   (after the normal sparse warnings are fixed, else you'll have a hard
   time seeing them I guess) - after that the single element struct thing
   can go away.  Also you're defining a CPU_IN_DISK_ORDER macro that's
   never used..
 - lease use kthread_* instead of kernel_thread() + lots of opencoding
