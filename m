From: William Stearns <wstearns@pobox.com>
Subject: Re: "file" command on a reiserfs filesystem
Date: Wed, 3 Apr 2002 11:36:15 -0500 (EST)
Message-ID: <Pine.LNX.4.44.0204031134050.2071-100000@sparrow.websense.net>
References: <15531.11723.687664.547488@laputa.namesys.com>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <15531.11723.687664.547488@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: ML-reiserfs <reiserfs-list@Namesys.COM>, Andreas Dilger <adilger@turbolabs.com>, William Stearns <wstearns@pobox.com>

Good day, Nikita,

On Wed, 3 Apr 2002, Nikita Danilov wrote:

> William Stearns writes:
>  > 	When I use the file command on a file that contains an ext2/ext3 
>  > filesystem, the file command returns:
>  > 
>  > [wstearns@sparrow test-resize]$ ls -al emptyfs.ext3.100
>  > -rw-------    1 wstearns wstearns 104857600 Apr  2 13:57 emptyfs.ext3.100
>  > [wstearns@sparrow test-resize]$ file emptyfs.ext3.100
>  > emptyfs.ext3.100: Linux rev 1.0 ext3 filesystem data
>  > 
>  > 	The signature comes from Andreas Dilger's contribution to 
>  > /usr/share/magic:
>  > 
>  > # ext2/ext3 filesystems - Andreas Dilger <adilger@turbolabs.com>
>  > 0x438   leshort         0xEF53          Linux
>  > >0x44c  lelong          x               rev %d
>  > >0x43e  leshort         x               \b.%d
>  > >0x45c  lelong          ^0x0000004      ext2 filesystem data
>  > >>0x43a leshort         ^0x0000001      (mounted or unclean)
>  > >0x45c  lelong          &0x0000004      ext3 filesystem data
>  > >>0x460 lelong          &0x0000004      (needs journal recovery)
>  > >0x43a  leshort         &0x0000002      (errors)
>  > >0x460  lelong          &0x0000001      (compressed)
>  > #>0x460 lelong          &0x0000002      (filetype)
>  > #>0x464 lelong          &0x0000001      (sparse_super)
>  > >0x464  lelong          &0x0000002      (large files)
>  > 
>  > 	Running file on a reiserfs file returns:
>  > 
>  > [wstearns@sparrow test-resize]$ file emptyfs.reiser.100  
>  > emptyfs.reiser.100: ASCII text, with no line terminators
>  > 
>  > 	Is there a similar signature that could identify a reiserfs file?
>  > 	The files I ran this on can be found at 
> 
> It definitely is somewhere. You can try to search archives for this
> mailing list. It required recompiling file(1) through, because reiserfs
> signature is at 16k offset and by default file(1) didn't look that
> far. But probably things changed since then.

	Many thanks, Nikita!  I'll look at the archives.
	Cheers,
	- Bill

---------------------------------------------------------------------------
        "Suppose for a moment that the automobile industry had developed
at the same rate as computers and over the same period: how much
cheaper and more efficient would the current models be?  If you have not
already heard the analogy, the answer is shattering.  Today you would be
able to buy a Rolls-Royce for $2.75, it would do three million miles to
the gallon, and it would deliver enough power to drive the Queen
Elizabeth II.  And if you were interested in miniaturization, you could
place half a dozen of them on a pinhead."
        -- Christopher Evans
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, named2hosts, 
and ipfwadm2ipchains are at:                        http://www.stearns.org
--------------------------------------------------------------------------

