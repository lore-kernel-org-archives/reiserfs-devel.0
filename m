From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: -mm -> 2.6.13 merge status
Date: Sun, 26 Jun 2005 14:03:24 +0400
Message-ID: <m1k6kh1llf.fsf@clusterfs.com>
References: <20050620235458.5b437274.akpm@osdl.org.suse.lists.linux.kernel>
	<p73d5qgc67h.fsf@verdi.suse.de> <42B86027.3090001@namesys.com>
	<20050621195642.GD14251@wotan.suse.de> <42B8C0FF.2010800@namesys.com>
	<84144f0205062223226d560e41@mail.gmail.com> <42BB0151.3030904@suse.de>
	<20050623114318.5ae13514.akpm@osdl.org> <20050623193247.GC6814@suse.de>
	<1119717967.9392.2.camel@localhost> <42BDAF3D.6060809@namesys.com>
	<87slz6f0vn.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24619-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87slz6f0vn.fsf@evinrude.uhoreg.ca> (Hubert Chan's message of
 "Sat, 25 Jun 2005 19:54:52 -0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hubert Chan <hubert@uhoreg.ca>
Cc: Jens Axboe <axboe@suse.de>, Andrew Morton <akpm@osdl.org>, Jeff Mahoney <jeffm@suse.de>, penberg@gmail.com, ak@suse.de, flx@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Hubert Chan <hubert@uhoreg.ca> writes:

> On Sat, 25 Jun 2005 12:23:41 -0700, Hans Reiser <reiser@namesys.com> said:
>
>>>> assert("trace_hash-89", is_hashed(foo) != 0);
>
>> Lots of people like corporate anonymity.  Some don't.  I don't.  I
>> like knowing who wrote what. ...
>
> For what it's worth (I know: not much), I like the named asserts in
> Reiser4/Reiserfs.  Although I haven't been bitten by any BUGs yet (maybe
> I'm just lucky), whenever I see these on the mailing list, it gives the
> impression that the users are interacting more directly with the
> developers, and it helps us to get to know the developers better.
>
> If people really want more standard-looking identifiers, I think Namesys
> should keep the names and make a hybrid identifier, like
> "nikita-123(<file>:<line>)"

This already happens: together with <uid>-<serial>, reiser4 outputs
__FILE__, __LINE__, __FUNCTION__, and a bunch of other stuff:

----------------------------------------------------------------------
reiser4[xine(11262)]: txn_end (fs/reiser4/txnmgr.c:504)[nominaodiosasunt-2967]:
code: -2 at fs/reiser4/search.c:1285
reiser4 panicked cowardly: assertion failed: lock_stack_isclean(get_current_lock_stack())
----------------------------------------------------------------------

Nikita.
