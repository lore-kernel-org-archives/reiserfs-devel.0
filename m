From: Chris Mason <mason@suse.com>
Subject: Re: Re: [PATCH CFT] tons of logging patches
Date: 16 Jun 2002 20:47:39 -0400
Message-ID: <1024274859.11086.68.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10751-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3D07CBE7.5080701@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Wed, 2002-06-12 at 18:32, Manuel Krause wrote:
> On 06/06/2002 02:09 AM, Chris Mason wrote:
> > Ok, ftp.suse.com/pub/people/mason/patches/data-logging has my latest
> > updates, which have more optimizations for many threads all doing
> > synchronous transactions.
> > 
> > -chris
> > 
> 
> Mmh. I recompiled with the new one when it appeared on the server and 
> kept the kernel append line with the obvious problem not to be able to 
> easily reboot to my ext2 maintenance partition.

Hmmm, I might have found it, but this isn't a new bug to the 07 patch. 
Have you been able to reproduce, or have you fallen back to the older
patches?

-chris


