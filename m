From: michael@styer.net
Subject: Re: missing files?
Date: Wed, 02 Feb 2005 09:18:53 -0500
Message-ID: <1107353933.2676.214151108@webmail.messagingengine.com>
References: <1107318853.18354.214122527@webmail.messagingengine.com>   
   <200502020533.j125X7U2016595@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200502020533.j125X7U2016595@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu, vs@namesys.com
Cc: reiserfs-list@namesys.com

On Wed, 02 Feb 2005 00:33:07 -0500, Valdis.Kletnieks@vt.edu said:
>
> > Can anyone explain why this might have happened and what I might be
> > able to do to fix it?
>
> Sounds like wonky file permissions on the directory - lack of write
> permission *on the directory* will cause 'rm' to fail.  Remember that
> renaming the directory requires write permission *on it's parent*, not
> on itself.

No, that's not it, but thanks for the suggestion. I'm doing this as root
and the directory is 755, so I should be able to remove the files no
problem. Also rm -f doesn't complain it can't remove it, just returns
with no output. But afterward ls still reports the directory is there,
and ls -l still can't find it.

Eg.

# ls parent/
target
# ls -l parent/
ls: parent/target: No such file or directory
# rm -f parent/target
# ls parent/
target
# ls -l parent/
ls: parent/target: No such file or directory
# ls -ld parent/
drwxr-xr-x  174 root root 174 Feb  1 23:30 parent/

On Wed, 02 Feb 2005 14:08:40 +0300, "Vladimir Saveliev" <vs@namesys.com>
said:
> Hello
>
> Is there anything about reiser4 in kernel logs?

Yes, in fact; there are lots of messages nearly identical to this:

Feb  2 03:19:31 apollo reiser4[rsync(17957)]: key_warning
(fs/reiser4/plugin/object.c:97)[nikita-717]:
Feb  2 03:19:31 apollo WARNING: Error for inode 483238 (-2)

The only difference between the messages is the process name and pid,
and the inode number (well, and the date and time, obviously).

Does that help?

Mike
