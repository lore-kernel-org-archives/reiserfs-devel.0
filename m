From: Hans Reiser <reiser@namesys.com>
Subject: Re: -mm -> 2.6.13 merge status
Date: Thu, 23 Jun 2005 12:45:10 -0700
Message-ID: <42BB1146.5050105@namesys.com>
References: <20050620235458.5b437274.akpm@osdl.org.suse.lists.linux.kernel>	<p73d5qgc67h.fsf@verdi.suse.de>	<42B86027.3090001@namesys.com>	<20050621195642.GD14251@wotan.suse.de>	<42B8C0FF.2010800@namesys.com>	<84144f0205062223226d560e41@mail.gmail.com>	<42BB0151.3030904@suse.de> <20050623114318.5ae13514.akpm@osdl.org> <42BB0D99.7070703@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24509-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BB0D99.7070703@suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.de>
Cc: Andrew Morton <akpm@osdl.org>, penberg@gmail.com, ak@suse.de, flx@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, penberg@cs.helsinki.fi

Jeff Mahoney wrote:

>All the assertions (a quick grep through the code shows something like
>3800 of them) ultimately result in a reiser4_panic, which BUG()'s. Are
>*all* of these assertions really worth taking the system down? I think a
>reiser4_error function that can abort just that filesystem and recover
>somewhat gracefully would be a bit more in order.
>  
>
A good point.  Thanks for it.
