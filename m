From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH CFT] tons of logging patches
Date: 02 Aug 2002 08:28:07 -0400
Message-ID: <1028291287.12934.207.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11110-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D30CB31.8040703@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello everyone,

I've uploaded 03-data-logging-24.diff, which fixes a tail packing oops
in data=journal mode, and fixes the data=ordered slow down (5-10%)
introduced in -23.  

-23 flushed all the ordered buffer heads with the journal lock held,
which meant no new transactions could start while the ordered buffers
were being flushed.  This was safe but slower.

-24 flushes them right before the commit blocks (like -19 did), and only
flushes the tail conversion targets with the journal lock held.  Doing
the tail conversion targets later risks losing the tail data after a
crash.

Thanks to grev@namesys.com who reported the ordered write bug in -19 and
the data=journal oops in -23.

-chris


