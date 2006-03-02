From: Andrew Morton <akpm@osdl.org>
Subject: Re: [Fwd: Re: [PATCH] reiserfs: use
 balance_dirty_pages_ratelimited_nr in reiserfs_file_write]
Date: Thu, 2 Mar 2006 15:08:59 -0800
Message-ID: <20060302150859.51ffb93f.akpm@osdl.org>
References: <4407386D.4070008@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28190-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4407386D.4070008@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: linux-kernel@vger.kernel.org, Reiserfs-List@namesys.com, green@linuxhacker.ru

Hans Reiser <reiser@namesys.com> wrote:
>
> I suspect that when someone did the search and replace when creating
> balance_dirty_pages_ratelimited_nr they failed to read the code and
> realize this code path was already effectively ratelimited.  The result
> is they made it excessively infrequent (every 1MB if ratelimit is 8) in
> its calling balance_dirty_pages.

??  There's been no change to balance_dirty_pages_ratelimited().  I merely
widened the interface a bit: introduced the new
balance_dirty_pages_ratelimited_nr() and did

static inline void
balance_dirty_pages_ratelimited(struct address_space *mapping)
{
	balance_dirty_pages_ratelimited_nr(mapping, 1);
}

That being said, if reiserfs has `number of pages' in hand then yes, it
makes sense to migrate over to balance_dirty_pages_ratelimited_nr().

> If anyone has ever seen this as an actual problem on a real system, I
> would be curious to hear of it.

No, I wouldn't expect it to make much difference.

All that gunk is there just to avoid calling the expensive
get_writeback_state() once per set_page_dirty().

Inaccuracy here will introduce the possibility that we'll transiently dirty
more memory than dirty_ratio permits, but it'll only be a little bit (eight
times the amount of memory which is dirtied per balance_dirty_pages_ratelimited()
call).

That's a small amount of memory.  But if you have 1000 filesystems mounted
and they all do the same thing at the same time, things could get a bit
sticky.  Your patch will (greatly) reduce the possibility of even that
scenario.

