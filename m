From: Oleg Drokin <green@namesys.com>
Subject: Re: corrupted fs: bitmap does not match to the correct one....
Date: Wed, 15 May 2002 17:08:55 +0400
Message-ID: <20020515170855.A986@namesys.com>
References: <3066.1021467577@www49.gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10309-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3066.1021467577@www49.gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: grobe@gmx.net
Cc: reiserfs-list@namesys.com

Hello!

On Wed, May 15, 2002 at 02:59:37PM +0200, grobe@gmx.net wrote:

> I have a bad problem with my reiserfs. I got a lot of SCSI-errors in the

Hm. SCSI errors are bad, and you have performed everything on the same hardware?
What kind of errors was there, by the way?

> logs, and did a reiserfsck --rebuild-tree. Than, I checked the (hopefuly) fixed
> fs, and now I get errors:

What version of reiserfsprogs was used?

> [...]
> node (9614688) with wrong level (1) found in the tree (should be 3)
> [...a lot of this]
> free block count 70151604 mismatches with a correct one 70141253
> on-disk bitmap des not match to the correct one. 8134442 bytes differ
> If I try to mount the fs, mount tells me "no directory"...

How about more error messages about scsi errors in the logs?

> I have resized the fs in the past, some months ago... is it possible that
> these errors result from a bad resize action? The fs was up for quite a long

Not likely. If you have extended the fs more than 132M in size, you'd
notice if something go wrong instantly.

> just would like to know if there is a chance to restore the fs, or should I
> just take the backup and build a new fs?

There is always a chance, another question (rather important in your case,
it seems) is what option would be faster.

Bye,
    Oleg
