From: Oleg Drokin <green@namesys.com>
Subject: Re: How to mount reiserfs with a relocated journal? -- Figured out
Date: Fri, 11 Jul 2003 10:00:29 +0400
Message-ID: <20030711060029.GB12406@namesys.com>
References: <20030711054630.GB12924@namesys.com> <003401c34771$51d29e60$6401a8c0@doug>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14876-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <003401c34771$51d29e60$6401a8c0@doug>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Bazarnic <doug@cavecreek.net>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jul 10, 2003 at 10:57:32PM -0700, Doug Bazarnic wrote:

> I've heard that using flash card memory (solid state devices) increases
> performance -- roughly 20-30%.   With the slower write speeds of 4 - 6
> MByte/sec,  I'm not sure if it would truly be faster.

This is well believable. You save on seeks to journal.

> The flash card is supposed to have a life greater than 1 million writes
> to it, so I don't know how well it will hold up in real life.  We're
> just looking for more speed.   We tend to rotate our database servers
> every 3 months or so, for something newer and faster.

You can try battery backed RAM which is going to be even faster.

> If the flash card does die, can't we just do a tree rebuild?

Yes, you can. Only if it was holding some valuable transaction,
you may not get it.

Bye,
    Oleg
