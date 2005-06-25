From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: -mm -> 2.6.13 merge status
Date: Sat, 25 Jun 2005 17:08:20 -0400
Message-ID: <20050625210820.GA26946@thunk.org>
References: <p73d5qgc67h.fsf@verdi.suse.de> <42B86027.3090001@namesys.com> <20050621195642.GD14251@wotan.suse.de> <42B8C0FF.2010800@namesys.com> <84144f0205062223226d560e41@mail.gmail.com> <42BB0151.3030904@suse.de> <20050623114318.5ae13514.akpm@osdl.org> <20050623193247.GC6814@suse.de> <1119717967.9392.2.camel@localhost> <42BDAF3D.6060809@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24595-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <42BDAF3D.6060809@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Jens Axboe <axboe@suse.de>, Andrew Morton <akpm@osdl.org>, Jeff Mahoney <jeffm@suse.de>, penberg@gmail.com, ak@suse.de, flx@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Sat, Jun 25, 2005 at 12:23:41PM -0700, Hans Reiser wrote:
> >>
> >>        assert("trace_hash-89", is_hashed(foo) != 0);
> >>
> Lots of people like corporate anonymity.  Some don't.  I don't.  I like
> knowing who wrote what.  It helps me know who to pay how much.  It helps
> me know who to forward the bug report to.   Losing your anonymity
> exposes you, mostly for better since more communication is on balance a
> good thing, but the fear is there for some.  I don't think we can agree
> on this, it is an issue of the soul. 

Fallacy.

The assert doesn't tell you who is at fault; it tells you who placed
the assert which triggered; it could have triggered due to bugs caused
by anyone, including the propietary binary-only module from Nvidia
which the user loaded into his system....

						- Ted
