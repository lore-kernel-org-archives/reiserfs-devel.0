From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 merging action list
Date: Mon, 27 Jun 2005 16:00:01 -0700
Message-ID: <42C084F1.70607@namesys.com>
References: <42BB7B32.4010100@slaphack.com> <200506240334.j5O3YowB008100@laptop11.inf.utfsm.cl> <20050627092138.GD11013@nysv.org> <20050627124255.GB6280@thunk.org> <42C0578F.7030608@namesys.com> <20050627212628.GB27805@thunk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24725-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050627212628.GB27805@thunk.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Theodore Ts'o <tytso@mit.edu>
Cc: Markus T?rnqvist <mjt@nysv.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, David Masover <ninja@slaphack.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Steve Lord <lord@xfs.org>


Andrew asked me to put together a list of things that need to be done
before merging:

    * VFS will dispatch directly to the method of the plugin for the
*_operations methods.  This requires duplicating to all plugin methods
the common code currently used by all reiser4 plugins for a given
method.  It has the desirable side effect of making the methods more
fully self-contained, which is somethng I had wanted two years ago and
was a little sad to not get, and the cost of duplicating some code. 
Since not all plugin methods are *_operations, it means we have two
structures with duplicated data, and duplicate data that must be in sync
at all times is classical badness in programming technique (see Codd and
normalization).                                 vs owns this task

    * review all sparse complaints, and revise as appropriate. 

    * panic and code beauty: everyone agrees that having function, file,
and line added to reiser4_panic output hurts nothing (I hope).  Everyone
agrees that restarting the machine without an error message seems like a
useless option to allow.   Much else was argued, not sure if anything
was a consensus view.  Various detail improvements were suggested by
Pecca, and I agreed with half of them.


   * metafiles should be disabled until we can present code that works
right.  Half the list thinks we cannot solve the cycles problem ever. 
Disable metafiles and postpone problem until working code, or the
failure to produce it, makes it possible to do more than rant at each
other.  This is currently already done in the -mm patches, but is
mentioned lest someone think it forgotten.

   * update the locking documentation

Probably I forget something.

Best,

Hans
