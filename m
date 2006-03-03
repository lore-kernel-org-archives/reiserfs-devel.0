From: Hans Reiser <reiser@namesys.com>
Subject: Re: [Fwd: Re: [PATCH] reiserfs: use balance_dirty_pages_ratelimited_nr
 in reiserfs_file_write]
Date: Fri, 03 Mar 2006 09:24:55 -0800
Message-ID: <44087BE7.4000908@namesys.com>
References: <4407386D.4070008@namesys.com> <20060302150859.51ffb93f.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28203-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060302150859.51ffb93f.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: linux-kernel@vger.kernel.org, Reiserfs-List@namesys.com, green@linuxhacker.ru

Andrew Morton wrote:

>Hans Reiser <reiser@namesys.com> wrote:
>  
>
>>I suspect that when someone did the search and replace when creating
>>balance_dirty_pages_ratelimited_nr they failed to read the code and
>>realize this code path was already effectively ratelimited.  The result
>>is they made it excessively infrequent (every 1MB if ratelimit is 8) in
>>its calling balance_dirty_pages.
>>    
>>
>
>??  There's been no change to balance_dirty_pages_ratelimited().  I merely
>widened the interface a bit: introduced the new
>balance_dirty_pages_ratelimited_nr() and did
>
>  
>
So we were not originally using balance_dirty() in place of
balance_dirty_pages_ratelimited?

At any rate, the change is obviously better, I think we all agree on that.
