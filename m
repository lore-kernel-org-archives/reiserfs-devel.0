From: Hans Reiser <reiser@namesys.com>
Subject: Re: List of things requested by lkml for reiser4 inclusion (to review)
Date: Mon, 12 Sep 2005 11:08:37 -0700
Message-ID: <4325C425.4030002@namesys.com>
References: <200509091817.39726.zam@namesys.com>	<4321C806.60404@namesys.com> <20050909144142.0f96802f.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25936-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050909144142.0f96802f.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: linux-kernel@vger.kernel.org, Reiserfs-Dev@namesys.com, reiserfs-list@namesys.com

Andrew Morton wrote:

>
>
>The type-unsafety of existing list_heads gives me conniptions too.  Yes,
>it'd be nice to have a type-safe version available.
>
>That being said, I don't see why such a thing cannot be a wrapper around
>the existing list_head functions.  Yes, there will be some ghastly
>C-templates-via-CPP stuff, best avoided by not looking at the file ;)
>
>We should aim for a complete 1:1 relationship between list_heads and
>type-safe lists.  So people know what they're called, know how they work,
>etc.  We shouldn't go adding things called rx_event_list_pop_back() when
>everyone has learned the existing list API.
>
>Of course, it would have been better to do this work as a completely
>separate kernel feature rather than bundling it with a filesystem.  If this
>isn't a thing your team wants to take on now then yes, I'd be inclined to
>switch reiser4 to list_heads.
>
>  
>
Vladimir spent 24 hours straight unsafing the lists in reiser4, and
didn't finish yet.  We need 1-2 more days to address this before we can
submit reiser4.  I hope this delay will not be too much of a problem.

Hans
