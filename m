From: Hans Reiser <reiser@namesys.com>
Subject: Re: -mm -> 2.6.13 merge status
Date: Sat, 25 Jun 2005 12:23:41 -0700
Message-ID: <42BDAF3D.6060809@namesys.com>
References: <20050620235458.5b437274.akpm@osdl.org.suse.lists.linux.kernel>	 <p73d5qgc67h.fsf@verdi.suse.de> <42B86027.3090001@namesys.com>	 <20050621195642.GD14251@wotan.suse.de> <42B8C0FF.2010800@namesys.com>	 <84144f0205062223226d560e41@mail.gmail.com> <42BB0151.3030904@suse.de>	 <20050623114318.5ae13514.akpm@osdl.org>  <20050623193247.GC6814@suse.de> <1119717967.9392.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24592-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1119717967.9392.2.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Jens Axboe <axboe@suse.de>, Andrew Morton <akpm@osdl.org>, Jeff Mahoney <jeffm@suse.de>, penberg@gmail.com, ak@suse.de, flx@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Pekka Enberg wrote:

>
>
>On Thu, 2005-06-23 at 21:32 +0200, Jens Axboe wrote:
>  
>
>>That said, I don't like the reiser name-number style. If you must do
>>something like this, mark responsibility by using a named identifier
>>covering the layer in question instead.
>>
>>        assert("trace_hash-89", is_hashed(foo) != 0);
>>    
>>
Lots of people like corporate anonymity.  Some don't.  I don't.  I like
knowing who wrote what.  It helps me know who to pay how much.  It helps
me know who to forward the bug report to.   Losing your anonymity
exposes you, mostly for better since more communication is on balance a
good thing, but the fear is there for some.  I don't think we can agree
on this, it is an issue of the soul. 
