From: Chris Mason <mason@suse.com>
Subject: Re: Strange errors with 2.4.22 patches (from Chris) and bonnie++
Date: Mon, 01 Dec 2003 08:49:10 -0500
Message-ID: <1070286549.12807.22.camel@tiny.suse.com>
References: <bq8f7u$ufn$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-16188-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <bq8f7u$ufn$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jens Benecke <jens-usenet@spamfreemail.de>
Cc: reiserfs-list@namesys.com

On Fri, 2003-11-28 at 16:38, Jens Benecke wrote:

> b) bonnie++ on a (previously created) reiserfs partition (with 
>    mkreiserfs 3.6.6) exited with random "disk full" errors, although 
>    the disk was never full. This didn't happen before.
> 
> 
> Details:
> 
> > bonnie++ -d . -s 2048 -m master1 -r 1024 -x 2 -u nobody:nogroup
> 
> Now bonnie++ exits randomly with "no space left on device" when 'df' clearly
> shows there is ample space left:
> 
> Writing with putc()...  
> Writing intelligently...
> Can't write block.
> Bonnie: drastic I/O error (write(2)): No space left on device
> 
> -rw-------    1 nobody   nogroup  474931200 Nov 28 22:04 Bonnie.19345.000
> -rw-------    1 nobody   nogroup         0 Nov 28 22:04 Bonnie.19345.001
> 
> Dateisystem          1k-Blöcke    Benutzt Verfügbar Ben% montiert auf
> /dev/ide/host0/bus0/target0/lun0/part7
>                        3044184    945424   2098760  32% /var
> 
> 
> This did not happen before I applied the patches.
> To be honest, I don't know how to debug this.
> 
> There is nothing in the syslog and nothing via 'dmesg' related to drbd or
> reiserfs.
>
> I would appreciate any help.
> Thank you! :-)

Ugh, the new block allocator isn't properly forcing a commit when an
allocation fails, so we don't reclaim blocks deleted in an uncommitted
transaction.  I thought this fix got pulled out of the suse kernel when
namesys and I pulled out the important bug fixes, but it got missed.

porting.

-chris


