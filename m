From: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Subject: Re: [PATCH CFT] tons of logging patches
Date: Mon, 03 Jun 2002 10:46:51 +0200
Message-ID: <m37klglpfo.fsf@merlin.emma.line.org>
References: <1023076301.22608.1778.camel@tiny>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10485-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1023076301.22608.1778.camel@tiny> (Chris Mason's message of
 "02 Jun 2002 23:51:41 -0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Chris Mason <mason@suse.com> writes:

> Hello everyone,
>
> ftp.suse.com/pub/people/mason/data-logging

You seem to mean:

ftp://ftp.suse.com/pub/people/mason/patches/data-logging/

> optimizations to keep kupdate from triggering commits every 5 seconds

Does this mean the current released ReiserFS versions are causing the
persistent write activity at 5 s interval that I observe?

Or is it ext3fs also?

-- 
Matthias Andree
