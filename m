From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiser4progs 1.0.4
Date: Mon, 21 Feb 2005 19:49:43 +0300
Message-ID: <200502211949.43255.vitaly@namesys.com>
References: <200502201344.41656.vitaly@namesys.com> <20050221131024.GA43266@xs4all.nl> <4219F19F.1030106@kmlinux.fjfi.cvut.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4219F19F.1030106@kmlinux.fjfi.cvut.cz>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jindrich Makovicka <makovick@kmlinux.fjfi.cvut.cz>
Cc: reiserfs-list@namesys.com

On Monday 21 February 2005 17:35, Jindrich Makovicka wrote:
> Ookhoi wrote:
>  > Fatal: Failed to open the reiser4 backup.
>  > Fatal: Cannot open the FileSystem on (/dev/hda1).
>  >
>  > 1 fatal corruptions were detected in SuperBlock. Run with --build-sb
>
> option to fix them.
>
>
> Anyway, what is the preferred way to convert reiser4 to this new backup
> layout? I have all reiser4 partitions created with reiserfsprogs 1.0.0,

there was no format changes since 1.0.0, just a problem in reiser4progs 
with writing backups to disk

> so 1.0.3 & 1.0.4 bail out. Using fsck.reiser4 --build-sb from
> reiser4progs 1.0.3 rendered the filesystem created under 1.0.0 unusable,

fsck.reiser4 --build-sb is supposed to fix evth. what goes wrong?

> I still didn't try fsck 1.0.4. I also found the -C option of
> debugfs.reiser4, but it didn't help either, and subsequent fsck also
> botched the filesystem. Were there any fixes in 1.0.4 regarding this?

-- 
Thanks,
Vitaly Fertman

