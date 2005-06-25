From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: -mm -> 2.6.13 merge status
Date: Sat, 25 Jun 2005 19:46:07 +0300
Message-ID: <1119717967.9392.2.camel@localhost>
References: <20050620235458.5b437274.akpm@osdl.org.suse.lists.linux.kernel>
	 <p73d5qgc67h.fsf@verdi.suse.de> <42B86027.3090001@namesys.com>
	 <20050621195642.GD14251@wotan.suse.de> <42B8C0FF.2010800@namesys.com>
	 <84144f0205062223226d560e41@mail.gmail.com> <42BB0151.3030904@suse.de>
	 <20050623114318.5ae13514.akpm@osdl.org>  <20050623193247.GC6814@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24589-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050623193247.GC6814@suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@suse.de>
Cc: Andrew Morton <akpm@osdl.org>, Jeff Mahoney <jeffm@suse.de>, penberg@gmail.com, reiser@namesys.com, ak@suse.de, flx@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Hi,

On Thu, 2005-06-23 at 21:32 +0200, Jens Axboe wrote:
> then it's impossible to know which one it is without the identical
> source at hand.

In which case, debugging is risky IMO (the source code could have
changed a lot).

On Thu, 2005-06-23 at 21:32 +0200, Jens Axboe wrote:
> That said, I don't like the reiser name-number style. If you must do
> something like this, mark responsibility by using a named identifier
> covering the layer in question instead.
> 
>         assert("trace_hash-89", is_hashed(foo) != 0);

A human readable message would be nicer. For example, "foo was hashed".

		Pekka

