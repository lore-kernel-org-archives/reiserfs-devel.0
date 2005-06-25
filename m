From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: -mm -> 2.6.13 merge status
Date: Sat, 25 Jun 2005 19:54:52 -0400
Message-ID: <87slz6f0vn.fsf@evinrude.uhoreg.ca>
References: <20050620235458.5b437274.akpm@osdl.org.suse.lists.linux.kernel>
	<p73d5qgc67h.fsf@verdi.suse.de> <42B86027.3090001@namesys.com>
	<20050621195642.GD14251@wotan.suse.de> <42B8C0FF.2010800@namesys.com>
	<84144f0205062223226d560e41@mail.gmail.com> <42BB0151.3030904@suse.de>
	<20050623114318.5ae13514.akpm@osdl.org>
	<20050623193247.GC6814@suse.de> <1119717967.9392.2.camel@localhost>
	<42BDAF3D.6060809@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24596-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BDAF3D.6060809@namesys.com> (Hans Reiser's message of "Sat,
 25 Jun 2005 12:23:41 -0700")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Jens Axboe <axboe@suse.de>, Andrew Morton <akpm@osdl.org>, Jeff Mahoney <jeffm@suse.de>, penberg@gmail.com, ak@suse.de, flx@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Sat, 25 Jun 2005 12:23:41 -0700, Hans Reiser <reiser@namesys.com> said:

>>> assert("trace_hash-89", is_hashed(foo) != 0);

> Lots of people like corporate anonymity.  Some don't.  I don't.  I
> like knowing who wrote what. ...

For what it's worth (I know: not much), I like the named asserts in
Reiser4/Reiserfs.  Although I haven't been bitten by any BUGs yet (maybe
I'm just lucky), whenever I see these on the mailing list, it gives the
impression that the users are interacting more directly with the
developers, and it helps us to get to know the developers better.

If people really want more standard-looking identifiers, I think Namesys
should keep the names and make a hybrid identifier, like
"nikita-123(<file>:<line>)"

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

