From: Domenico Andreoli <cavok@tiscali.it>
Subject: Re: reiser4 disk formats (was http://www.namesys.com/snapshots/2004.08.09-internal.testing/)
Date: Fri, 13 Aug 2004 19:25:30 +0200
Message-ID: <20040813172530.GA15575@raptus.homelinux.net>
References: <20040813171827.GA15303@raptus.homelinux.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20276-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040813171827.GA15303@raptus.homelinux.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Fri, Aug 13, 2004 at 07:18:27PM +0200, Domenico Andreoli wrote:
> On Mon, Aug 09, 2004 at 11:49:31PM +0400, Vitaly Fertman wrote:
> > 
> > and it has a converter from the previous format to the new one -- if you 
> > already created a reiser4 fs with the mkfs from some previous version 
> > of reiser4progs, first of all run 
> >     $ debugfs.reiser4 -C device
>  
> [ why i can't find any -C option in the debugfs.reiser4' manpage? it
> is instead present in the help of debugfs.reiser4. probably i'll add
> it to the debian manpage. ]
> 
> if i launched this command using reiser4progs 1.0.0 would it make all
> the required conversions to bring up to date the disk format?
> 
> the problem is that in debian currently i have two versions of
> reiser4progs, 0.5.3 and 0.5.6. in the next few days i want to upload also
> 1.0.0 to push it into sarge (the next debian stable due to being released
> in few weeks and for which the uploads will be closed on 17th August).
> 
> hence i must explain to the user what she is required to do in order
> to update her filesystems and kernel.
> 
> IIRC 0.5.3, 0.5.6 and 1.0.0 have all different disk format, haven't them?
> 
> are the following the commands required to properly convert the disk
> formats?
> 
> to convert a 0.5.3 to a 0.5.6:
>   $ fsck.reiser4 <device>
> 
> to convert a 0.5.6 to 1.0.0:
>   $ debugfs.reiser4 -C <device>
    $ fsck.reiser4 [--fix] <device>
> 
> to convert a 0.5.3 to a 1.0.0:
>   $ fsck.reiser4 [--fix] <device>
>   $ debugfs.reiser4 -C <device>
    $ fsck.reiser4 [--fix] <device>

it looks i have also been touched by the "wrong bytes" bug (wasn't
it solved??)

thanks again
domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://people.debian.org/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
