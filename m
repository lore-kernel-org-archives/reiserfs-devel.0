From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: [PATCH] verbose BUG_ON reporting
Date: Mon, 27 Jun 2005 14:40:00 +0200
Message-ID: <20050627124000.GA24549@wohnheim.fh-wedel.de>
References: <84144f0205062223226d560e41@mail.gmail.com> <42BB0151.3030904@suse.de> <20050623114318.5ae13514.akpm@osdl.org> <20050623193247.GC6814@suse.de> <1119717967.9392.2.camel@localhost> <20050627072449.GF19550@suse.de> <20050627072832.GA14251@wotan.suse.de> <Pine.LNX.4.58.0506271048310.26869@sbz-30.cs.Helsinki.FI> <20050627082046.GC14251@wotan.suse.de> <Pine.LNX.4.58.0506271525240.3200@sbz-30.cs.Helsinki.FI>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24694-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0506271525240.3200@sbz-30.cs.Helsinki.FI>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pekka J Enberg <penberg@cs.Helsinki.FI>
Cc: Andi Kleen <ak@suse.de>, Jens Axboe <axboe@suse.de>, Andrew Morton <akpm@osdl.org>, Jeff Mahoney <jeffm@suse.de>, penberg@gmail.com, reiser@namesys.com, flx@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Mon, 27 June 2005 15:27:50 +0300, Pekka J Enberg wrote:
> On Mon, 27 Jun 2005, Andi Kleen wrote:
> > It won't work for me because it'll bloat the kernel .text
> > considerable. There is a reason why BUG is implemented
> > like it is. Compare it.
>=20
> The assertion codes bloat the kernel all the same. So how about this=20
> instead?

Removes my objections.  I still wouldn't want to enable the config
option, but maybe others do.

J=F6rn

--=20
A surrounded army must be given a way out.
-- Sun Tzu
