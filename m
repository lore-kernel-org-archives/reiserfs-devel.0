From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Failed conversion -> undelete loopback file?
Date: Wed, 14 Apr 2004 17:02:03 +0400
Message-ID: <200404141655.03989.vitaly@namesys.com>
References: <Pine.LNX.4.58.0404140752140.32161@renaissance.laroia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17929-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0404140752140.32161@renaissance.laroia.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Asheesh Laroia <asheesh@asheesh.org>, reiserfs-list@namesys.com

Hello

On Wednesday 14 April 2004 16:04, Asheesh Laroia wrote:
> I used the convertfs toolkit from http://tzukanov.narod.ru/convertfs/ to
> convert my reiserfs filesystem to ext3.  I wanted to do this because the
> kernel I had installed doesn't support reiserfs.
>
> So I booted of the MEPIS Live CD to do the conversion.
>
> So the first time I tried, it created an ext3 filesystem full of errors,
> but since the process died early, it didn't delete any source files.  I
> deleted the loopback file it created and ran reiserfsck 3.6.14, which told
> to me rebuld-tree, so I did.
>
> I then tried again.  I got an error on unmount, but the process seemed to
> have finished.  So I rebooted back into MEPIS.
>
> Now on mount, my reiserfs partition said:
>
> Using r5 hash to sort names
> Removing [2 11 0x0 SD]...done
> There were 1 uncompleted unlinks/truncates. Completed.
>
> That deletion took a long time, so it probably just deleted the loopback
> ext3 filesystem.  The reiserfs partition now contains no directories or
> files.  The partition shows 33MB used (out of 50GB).
>
> But a quick look inside ("less -f /dev/hdb6") shows my data are still
> around somewhere.
>
> Is it possible to undo that deletion of [2 11 0x0 SD]?  What should I
> consider?

If 'reiserfsck /dev/hdb6' finds no corruption, then make a backup 
of the partition and run
    reiserfsck --rebuild-tree -S -l logfile /path_to_the_backup
This searches for the reiserfs metadata on the unused space also 
and probably will recover deleted data.
If 'reiserfsck /dev/hdb6' finds some corruption, do the same
without -S option first and if you get no wanted data, repeat
everything with -S.

-- 
Thanks,
Vitaly Fertman

