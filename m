From: Domenico Andreoli <cavok@tiscali.it>
Subject: Re: reiser4 disk formats (was http://www.namesys.com/snapshots/2004.08.09-internal.testing/)
Date: Mon, 16 Aug 2004 00:55:01 +0200
Message-ID: <20040815225501.GA8679@raptus.homelinux.net>
References: <20040813171827.GA15303@raptus.homelinux.net> <200408151524.34396.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20309-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408151524.34396.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Sun, Aug 15, 2004 at 03:24:34PM +0400, Vitaly Fertman wrote:
>
> there were a few format changes in 0.5.5. The first one is the formatting policy 
> id was changed, to fix this
>   fsck.reiser4 --build-sb device
> is needed. The second is object plugin sets. It was supposed to run
>   fsck.reiser4 --fix device
> to add pset to the root directory. Actually you could merely run
>   fsck.reiser4 device
> and it tells you what to do next.
>
> To jump from 0.5.3 to 1.0.0 it would be better to run:
>   fsck.reiser4 --build-sb device
>   debugfs.reiser4 -C device
>   fsck.reiser4 --fix device
> all tools are from 1.0.0 here.
>
> The converter (debugfs.reiser4 -C) is supposed to be run on consistent fs of
> course, so probably it is worth to check/fix it with the current reiser4progs
> before any update.
>

so the most safe catch-all command sequence should be simply

  1. fsck.reiser4 device
     - do also whatever fsck says is required to bring the fs
       consistent. most probably it will say to use --build-sb and
       then --fix.
  2. debugfs.reiser4 -C device
  3. fsck.reiser4 device
     - do again whatever fsck says, most probably --fix is required.

this should bring the fs from whatever disk format it is in to the
latest one and this *should* happen without data loss. am i right?

is command 2. idempotent?

i'd like to say to my users something like this:
  
  "ok, until this moment we have been playing. if you want to play
   harder, whatever state your disk is in, the command sequence is the
   following [...]. your data should be preserved but making a backup
   copy might be a good idea."

many thanks.

cheers
domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://people.debian.org/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
