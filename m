From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] new data logging and quota patches available
Date: 23 Feb 2003 09:56:07 -0500
Message-ID: <1046012167.16042.401.camel@tiny.suse.com>
References: <1045870331.16048.325.camel@tiny.suse.com>
	 <200302221341.23799.Dieter.Nuetzel@hamburg.de>
	 <1045926958.16042.366.camel@tiny.suse.com>
	 <1045930351.16042.377.camel@tiny.suse.com>
	 <3E581AD7.30000@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12873-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E581AD7.30000@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Sat, 2003-02-22 at 19:50, Manuel Krause wrote:

[ patch to leave inodes dirty instead of constantly logging them ]
> Hi Chris!
> 
> At least I'm not able to copy through my partition via "cp -a ..." with 
> the last supposed setup + preempt without quota ...
> 
> When umounting the destination partition it says "device is busy".
> 
> I don't know what is gone for now on my repository partition, but I know 
> from earlier times this should not happen.

A side not about this optimization.  It only affects inode updates for
mtime/ctime/atime, critical things like updating i_size or the block
count or other stat data operations are still logged every time, and
always logged in the same transaction as the critical metadata update.

In other words, this patch restores reiserfs to its 2.2.x inode update
scheme.

-chris



