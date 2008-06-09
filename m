From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: =?UTF-8?B?4oCeVG9vIG1hbnkgaXRlcmF0aW9uc+KAnCBhbmQgZnNjay5yZWk=?=
 =?UTF-8?B?c2VyNCBmYWlsdXJl?=
Date: Tue, 10 Jun 2008 01:29:12 +0400
Message-ID: <484DA0A8.8010401@gmail.com>
References: <17734422.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <17734422.post@talk.nabble.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Andrej Podzimek <andrej@podzimek.org>
Cc: reiserfs-devel@vger.kernel.org

Andrej Podzimek wrote:
> Hello,
>  =20
Hello

> my laptop system has been in use with Reiser v4 for half a year or so=
=2E

Please, make sure that you are using the latest version of reiser4:
there was a bug which could cause data corruption:
http://marc.info/?l=3Dreiserfs-devel&m=3D120914767218498&w=3D2

>  There
> may have been some unexpected restarts and system crashes during that
> time... KDE refused to start today. This time it was not just a usual
> problem with user permissions. This is what I found in kernel.log:
>
> Jun  9 12:23:38 xandrej reiser4[kbuildsycoca(3104)]: traverse_tree
> (fs/reiser4/search.c:689)[nikita-1481]:
> Jun  9 12:23:38 xandrej WARNING: Too many iterations: 128
>  =20
[...]
> (fs/reiser4/search.c:722)[nikita-373]:
> Jun  9 12:23:40 xandrej WARNING: reiser-2018: Too many iterations. Tr=
ee
> corrupted, or (less likely) starvation occurring.: level: 4, lock_lev=
el: 2,
> stop_level: 1 lock_mode: read, bias: left-slant
> Jun  9 12:23:40 xandrej reiser4[kbuildsycoca(3104)]: tail2extent
> (fs/reiser4/plugin/file/tail_conversion.c:516)[nikita-2282]:
> Jun  9 12:23:40 xandrej WARNING: Partial conversion of 2426179: -5
>
> Running fsck.reiser4 revealed corruption on all of my Reiser4 volumes=
=2E All
> of them could be fixed, except for /home. :-( I ran fsck.reiser4 --bu=
ild-fs
> --build-sb. Everything went just fine until the sematic tree scan. It=
 got
> stuck at 99% with intensive disk usage. After about 10 minutes, the p=
rogram
> ended with an error message (=E2=80=9Eoperational error=E2=80=9C or s=
omething of that kind).
> (Just one line, no further details.)
>
>  =20

This is a problem in fsck, and I can not promise to fix it quickly.

Would you please pack the metadata of your /home by
debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
and let me download the file meta.gz

Thanks,
Edward.

> The hard drive is a relatively recent Seagate Momentus 100 GB, 7200 R=
PM,
> 2,5", IDE, checked with smartctl regularly. The drive doesn't seem to=
 be the
> cause of this...
>
> However, after the (probably unfinished) disk scan, I could still mou=
nt the
> /home partition and KDE started just fine this time. The file system =
is
> probably not in a consistent state right now. What could I do to stop
> further corruption? What scan options should I use?
>
> I am using ArchLinux and the reiser4progs package supplied with the d=
istro.
>
> Best regards,
>
> Andrej Podzimek
>  =20

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
