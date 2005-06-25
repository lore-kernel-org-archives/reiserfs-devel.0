From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Sat, 25 Jun 2005 13:52:50 -0700
Message-ID: <42BDC422.6020401@namesys.com>
References: <200506240241.j5O2f1eb005609@laptop11.inf.utfsm.cl> <42BCD93B.7030608@slaphack.com> <200506251420.j5PEKce4006891@turing-police.cc.vt.edu>            <42BDA377.6070303@slaphack.com> <200506252031.j5PKVb4Y004482@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24594-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506252031.j5PKVb4Y004482@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Valdis.Kletnieks@vt.edu wrote:

> Hmm.. let's see.. I said Reiser isn't in because it shouldn't be
> screwing with
>
>the VFS, and said stuff should be done separate from the Reiser4 filesystem.
>  
>
We don't touch a line of VFS code.  We look like a normal fs at the
interface.

Shall we send in a file labeled reiservfs.c containing the plugin layer?
That will really test whether the Reiser name is cursed that way, yes?

There has been no response to the technical email asking for what
exactly it is that is duplicative, and what exactly it is that ought to
be changed in how the code works, as opposed to what file the code is
placed in, or who is considered its maintainer.    There has been no
response to the questions about whether the difference between class and
instance makes our layer non-duplicative.

Perhaps no response was possible?

Hans
