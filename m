From: Andrew Morton <akpm@osdl.org>
Subject: Re: -mm -> 2.6.13 merge status
Date: Thu, 23 Jun 2005 11:43:18 -0700
Message-ID: <20050623114318.5ae13514.akpm@osdl.org>
References: <20050620235458.5b437274.akpm@osdl.org.suse.lists.linux.kernel>
	<p73d5qgc67h.fsf@verdi.suse.de>
	<42B86027.3090001@namesys.com>
	<20050621195642.GD14251@wotan.suse.de>
	<42B8C0FF.2010800@namesys.com>
	<84144f0205062223226d560e41@mail.gmail.com>
	<42BB0151.3030904@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24503-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BB0151.3030904@suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.de>
Cc: penberg@gmail.com, reiser@namesys.com, ak@suse.de, flx@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, penberg@cs.helsinki.fi

Jeff Mahoney <jeffm@suse.de> wrote:
>
> >>+	assert("nikita-955", pool != NULL);
>  > 
>  > These assertion codes are meaningless to the rest of us so please drop
>  > them.
> 
>  As someone who spends time debugging reiser3 issues, I've grown
>  accustomed to the named assertions. They make discussing a particular
>  assertion much more natural in conversation than file:line.

__FUNCTION__?
