From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: missing files?
Date: Wed, 2 Feb 2005 19:10:15 +0300
Message-ID: <200502021910.15862.vitaly@namesys.com>
References: <1107318853.18354.214122527@webmail.messagingengine.com> <200502020533.j125X7U2016595@turing-police.cc.vt.edu> <1107353933.2676.214151108@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1107353933.2676.214151108@webmail.messagingengine.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael@styer.net, Valdis.Kletnieks@vt.edu
Cc: reiserfs-list@namesys.com

On Wednesday 02 February 2005 17:18, michael@styer.net wrote:
> On Wed, 02 Feb 2005 00:33:07 -0500, Valdis.Kletnieks@vt.edu said:
> > > Can anyone explain why this might have happened and what I might be
> > > able to do to fix it?
> >
> > Sounds like wonky file permissions on the directory - lack of write
> > permission *on the directory* will cause 'rm' to fail.  Remember that
> > renaming the directory requires write permission *on it's parent*, not
> > on itself.
>
> No, that's not it, but thanks for the suggestion. I'm doing this as root
> and the directory is 755, so I should be able to remove the files no
> problem. Also rm -f doesn't complain it can't remove it, just returns
> with no output. But afterward ls still reports the directory is there,
> and ls -l still can't find it.
>
> Eg.
>
> # ls parent/
> target
> # ls -l parent/
> ls: parent/target: No such file or directory
> # rm -f parent/target
> # ls parent/
> target
> # ls -l parent/
> ls: parent/target: No such file or directory
> # ls -ld parent/
> drwxr-xr-x  174 root root 174 Feb  1 23:30 parent/
>
> On Wed, 02 Feb 2005 14:08:40 +0300, "Vladimir Saveliev" <vs@namesys.com>
>
> said:
> > Hello
> >
> > Is there anything about reiser4 in kernel logs?
>
> Yes, in fact; there are lots of messages nearly identical to this:
>
> Feb  2 03:19:31 apollo reiser4[rsync(17957)]: key_warning
> (fs/reiser4/plugin/object.c:97)[nikita-717]:
> Feb  2 03:19:31 apollo WARNING: Error for inode 483238 (-2)
>
> The only difference between the messages is the process name and pid,
> and the inode number (well, and the date and time, obviously).
>
> Does that help?

would you pack the metadata with 
	debugfs.reiser4 -P <device> | bzip2 -c > <device>.bz2
and let us to download them?

-- 
Thanks,
Vitaly Fertman

