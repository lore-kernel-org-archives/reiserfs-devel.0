From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: Undeletable files...
Date: Sat, 15 Apr 2006 23:58:07 +0400
Message-ID: <200604152358.07338.zam@namesys.com>
References: <44414617.8030001@sharp.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28496-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44414617.8030001@sharp.fm>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Graham Leggett <minfrin@sharp.fm>

hello

On Saturday 15 April 2006 23:14, Graham Leggett wrote:
> Hi all,
>
> I am using a reiserfs partition mounted using Redhat Enterprise's
> 2.6.9-22.0.1.EL (rebuilt), and I have files that refuse to delete:

Are there any reiserfs error messages in the system logs?

> [root@gatekeeper proc]# ls -al p*
> -rw-r--r--  1 root root 0 Apr 15 20:50 partitions
> -rw-r--r--  1 root root 0 Apr 15 20:50 pci
> [root@gatekeeper proc]# rm -f p*
> rm: cannot remove `partitions': Operation not permitted
> rm: cannot remove `pci': Operation not permitted

It looks as another procfs mount point, 
can you please do "stat -f partitions" to check that?

> [root@gatekeeper proc]# pwd
> /var/lib/diskless/i386/fedora-core-2/root/proc
>
> (The files were somehow copied from a /proc tree, they are otherwise
> normal files).
>
> For some reason they are not deletable. The partition is mounted like
> this:
>
> /dev/sda4 on /var type reiserfs (rw)
>
> I tried to find a way of running reiserfsck against the partition,
> but for some reason this is impossible on a read/write filesystem.
> The machine is not geographically nearby, so unmounting it is not
> possible at the moment.
>
> Can anyone recommend a way to rescue this filesystem, or am I going
> to have to make the drive of shame?
>
> The reiserfs-utils package I am using is reiserfs-utils-3.6.4-5.
>
> Regards,
> Graham
> --

-- 
Alex.
