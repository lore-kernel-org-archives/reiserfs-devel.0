From: Bryan Henderson <hbryan@us.ibm.com>
Subject: Re: FIFO files
Date: Wed, 18 Jun 2003 08:45:20 -0700
Message-ID: <OF264C9E27.1BA607E9-ON87256D49.0055AF5C-88256D49.00567F08@us.ibm.com>
References: <20030618142843.GP24357@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14614-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030618142843.GP24357@parcelfarce.linux.theplanet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@debian.org>
Cc: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, Cyrille Chepelov <cyrille@chepelov.org>, David Woodhouse <dwmw2@infradead.org>, Oleg Drokin <green@namesys.com>, linux-fsdevel@vger.kernel.org, linux-fsdevel-owner@vger.kernel.org, Hans Reiser <reiser@namesys.com>, Ragnar =?ISO-8859-1?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, reiserfs-list@namesys.com





The semantics are really not controversial.  They are the same as a write()
of zeroes.

>what are the semantics of another
>thread or process reading from a block that's been punched out?

It should read zeroes.

>what are
>the semantics of another thread or process writing to a block that gets
>punched out?

If it writes after the punching, the data it writes ends up in the file.
If it writes before the punching, a hole ends up in the file.  It can't
write at the same time as the punching because of the atomic write
guarantee.

>what are the semantics of another thread or process that
>has this region of the file mmaped?

It should see zeroes.

>what are the semantics if this thread has it mmaped?

Same.

>what if two threads try to punch out overlapping
>regions simultaneously?

The union of the two regions gets cleared (but there might be fewer blocks
actually removed from the file than if the entire region were punched at
once, owing to implementation realities).

>what if a region is being truncated and punched
>out at the same time?

Same.

