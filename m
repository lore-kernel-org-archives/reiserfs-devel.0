From: Oleg Drokin <green@namesys.com>
Subject: Re: How to mount reiserfs with a relocated journal? -- Figured out
Date: Fri, 11 Jul 2003 09:46:30 +0400
Message-ID: <20030711054630.GB12924@namesys.com>
References: <008b01c34751$ec654a10$7000000a@hardwarehq.local> <009a01c3475c$31dc9990$7000000a@hardwarehq.local>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14874-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <009a01c3475c$31dc9990$7000000a@hardwarehq.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Bazarnic <doug@cavecreek.net>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jul 10, 2003 at 08:26:19PM -0700, Doug Bazarnic wrote:

> Any way, is there a down side to using a large journal?  8193 vs ~125000
> block size?   Right now, I've allocated the entire 512 meg flash card
> for the journal size.   

Well, if your flash card will die, you have possibly more data to loose.
Also keep in mind that journal header gets updated for every transaction
(in fact the should be batched so this should not be so hard hit, esp.
for large journals, but still).

Hm, I think for large journals you may also want to increase journal flushtime.
Unfortunatelly this is hardwired to be once in 5 seconds.
fs/reiserfs/journal.c and look for "interruptible_sleep_on_timeout(&reiserfs_commit_thread_wait, 5 * HZ) ;",
change 5 to whatever number of seconds you may want. May and will lead to increased memory consumption when
combined with large journals, though.

Bye,
    Oleg
