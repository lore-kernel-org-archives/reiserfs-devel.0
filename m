From: "Doug Bazarnic" <doug@cavecreek.net>
Subject: RE: How to mount reiserfs with a relocated journal? -- Figured out
Date: Thu, 10 Jul 2003 22:57:32 -0700
Message-ID: <003401c34771$51d29e60$6401a8c0@doug>
References: <20030711054630.GB12924@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14875-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030711054630.GB12924@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Oleg Drokin' <green@namesys.com>
Cc: reiserfs-list@namesys.com

I've heard that using flash card memory (solid state devices) increases
performance -- roughly 20-30%.   With the slower write speeds of 4 - 6
MByte/sec,  I'm not sure if it would truly be faster.

I haven't time to test anything yet myself.

The flash card is supposed to have a life greater than 1 million writes
to it, so I don't know how well it will hold up in real life.  We're
just looking for more speed.   We tend to rotate our database servers
every 3 months or so, for something newer and faster.

If the flash card does die, can't we just do a tree rebuild?

Doug


-----Original Message-----
From: Oleg Drokin [mailto:green@namesys.com] 
Sent: Thursday, July 10, 2003 10:47 PM
To: Doug Bazarnic
Cc: reiserfs-list@namesys.com
Subject: Re: How to mount reiserfs with a relocated journal? -- Figured
out

Hello!

On Thu, Jul 10, 2003 at 08:26:19PM -0700, Doug Bazarnic wrote:

> Any way, is there a down side to using a large journal?  8193 vs
~125000
> block size?   Right now, I've allocated the entire 512 meg flash card
> for the journal size.   

Well, if your flash card will die, you have possibly more data to loose.
Also keep in mind that journal header gets updated for every transaction
(in fact the should be batched so this should not be so hard hit, esp.
for large journals, but still).

Hm, I think for large journals you may also want to increase journal
flushtime.
Unfortunatelly this is hardwired to be once in 5 seconds.
fs/reiserfs/journal.c and look for
"interruptible_sleep_on_timeout(&reiserfs_commit_thread_wait, 5 * HZ)
;",
change 5 to whatever number of seconds you may want. May and will lead
to increased memory consumption when
combined with large journals, though.

Bye,
    Oleg


