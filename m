From: Oleg Drokin <green@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 20:13:21 +0300
Message-ID: <20030212201321.A25086@namesys.com>
References: <NDBBJPAGKLCMDEIEKOPBAEIMKFAA.mailinglists@websitemanagers.com.au> <3452483515.20030212001747@tnonline.net> <200302121925.56902.vitaly@namesys.com> <48116033718.20030212175658@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12727-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <48116033718.20030212175658@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Feb 12, 2003 at 05:56:58PM +0100, Anders Widman wrote:
 
> > So it would be possible to do some actions to 1) get some blocks back in the described
> > way, 1.1) write to really bad blocks should have remaped them already here if there is
> > a space in remap area 2) save bad blocks to badblock list in fs if they are still bad -
> > out of remap area. 
> > Would be not bad to try to recover in this way already remapped blocks - do not know how
> > to get the list of them only.
> > Ok, but what if the IO error you got is not a bad block, but a bad cable? Do you want
> > the fs to work in the described way? Trying to fix all automatically? I am not sure.
>   How about trial and (then) error? :)

That might be suitable for fsck, but not for kernel I am sure.
Kernel should just probably return error or try to use different block (if it was
doing write) and if certain number of attempts failed, return error too.
Also remount R/O if write error is in system area (journal, superblock, bitmaps)
or special mount option was given that demands remounting R/O on io errors.

Bye,
    Oleg
