From: "Barry, Christopher" <cbarry@infiniconsys.com>
Subject: OT:RE: How to mount reiserfs with a relocated journal? -- Figured out
Date: Fri, 11 Jul 2003 02:04:28 -0400
Message-ID: <08628CA53C6CBA4ABAFB9E808A5214CB4BDF42@mercury.infiniconsys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14877-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

If radical speed is what you want, then you want what we make.
InfinIO 7000/InfiniServ 7000/and the new 32xx series coming soon.
www.infinicon.com

-Christopher

-----Original Message-----
From: Doug Bazarnic [mailto:doug@cavecreek.net]
Sent: Friday, July 11, 2003 1:58 AM
To: 'Oleg Drokin'
Cc: reiserfs-list@namesys.com
Subject: RE: How to mount reiserfs with a relocated journal? -- Figured
out


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
From: Oleg Drokin [mailto:green@namesys.com]=20
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
> for the journal size.  =20

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


