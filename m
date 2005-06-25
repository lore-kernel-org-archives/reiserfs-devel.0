From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Fri, 24 Jun 2005 17:35:16 -0700
Message-ID: <42BCA6C4.9060800@namesys.com>
References: <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl> <42BB31E9.50805@slaphack.com> <1119570225.18655.75.camel@localhost.localdomain> <42BB7B32.4010100@slaphack.com> <1119612849.17063.105.camel@localhost.localdomain> <42BC5D2E.1070307@namesys.com> <20050624230644.GA20185@thunk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24566-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050624230644.GA20185@thunk.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Theodore Ts'o <tytso@mit.edu>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

fsck is better in V4 than it is in V3. Users should move from V3 to V4,
as V3 is obsolete. I agree on that Ted.

I also agree that Ted did a great job with fsck.ext*.

V3 was where we learned. There are performance problems in V3 that I
could only fix by writing V4. The balancing code for V3 was extremely
difficult to modify because it understood all the internals of the item
structures, and that is why we based V4 on plugins. V3 had a time where
it was really useful, and the time when it was the only metadata
journaling filesystem for Linux was its high point (thanks Chris), but
its usefulness is leaving us very soon now with V4. In 12 months, after
V4 has been pounded on by a few million users, few will want to make new
installs onto V3 instead of V4.

It would be nice if we could concentrate on speeding that transition
instead of flaming each other.

I would like to thank the ext* team, especially Ted, for a great
filesystem that I used for many years while developing V3, that was
crucial to the early success of Linux, and that is still useful to a
great many.

Hans
