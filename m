From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH CFT] tons of logging patches
Date: 03 Jun 2002 22:57:42 -0400
Message-ID: <1023159462.31682.54.camel@tiny>
References: <1023076301.22608.1778.camel@tiny> 
	<3CFC1CB5.8040102@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10496-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CFC1CB5.8040102@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Mon, 2002-06-03 at 21:49, Manuel Krause wrote:

> 
> Now it is "only":
> Kernel.2.4.19-pre9
> ReiserFS.pending.01..03,05 (rest doesn't cooperate cleanly)
> ReiserFS.mason.01..03 (maybe slightly modified for this)
> rml.preempt-kernel (          -"-                 )
> 
> / mounted -o noatime,notail,data=logging

Ah, still on the todo list for the current patch is safe handling of
remount.  Currently data=logging and data=ordered are ignored on
remount, which is probably why your results were so fast in data logging
mode.

You'll want to pass rootflags=data=ordered or rootflags=data=journal at
the lilo prompt.

-chris


