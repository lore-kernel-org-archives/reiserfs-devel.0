From: Hans Reiser <reiser@namesys.com>
Subject: Re: bug: Unable to mount reiserfs from DVD+R
Date: Thu, 31 Aug 2006 12:54:10 -0700
Message-ID: <44F73E62.3030605@namesys.com>
References: <44F62065.5020500@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29770-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44F62065.5020500@baldauf.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Chris Mason <mason@suse.com>

Xu=E2n Baldauf wrote:
> Hello,
>
> I created backup DVDs formatted using reiserfs. However, mounting them
> is not possible. If I try to mount such a DVD, I get following results:
>
> Aug 31 01:08:18 notebook2 kernel: ReiserFS: hdc: using ordered data mode
> Aug 31 01:08:18 notebook2 kernel: ReiserFS: hdc: warning: sh-458:
> journal_init_dev: cannot init journal device 'unknown-block(22,0)': -30
> Aug 31 01:08:18 notebook2 kernel: ReiserFS: hdc: warning: sh-462: unable
> to initialize jornal device
> Aug 31 01:08:18 notebook2 kernel: ReiserFS: hdc: warning: sh-2022:
> reiserfs_fill_super: unable to initialize journal space
>
> I get this error even when mounting using "-o ro,nolog".
>
> I tracked this down to the method "journal_init_dev", which opens the
> journal device with mode "blkdev_mode =3D FMODE_READ | FMODE_WRITE;"
> except when the journal device is marked read only. However, as it
> seems, my DVD burner drive is able to write DVD media (so it is not a
> read-only-device, in general), but the particular DVD is only readable,
> not writable. That's why (I think) the journal device itself is not
> marked read only and yet "open_by_devnum(jdev, blkdev_mode);" fails.
>
> The method "journal_init_dev" should honor the mount options "ro" or
> "nolog" or both, which it currently does not (as of Linux 2.6.18-rc4).
> Alternatively, method "journal_init_dev" might try to open the journal
> device again (only using "read only" mode) in case the first try to open
> results in -EROFS.
>
> Xu=E2n Baldauf.
>
>
>
>  =20
Sounds reasonable to me, Chris?
