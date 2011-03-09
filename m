From: Serkan Kaba <serkan@gentoo.org>
Subject: Re: File copy problems kde 4.5 to 4.6.1 with reiser4
Date: Wed, 9 Mar 2011 12:32:46 +0200
Message-ID: <AANLkTikRbBP=XeNtvMkN=jYDVcuTZdqAM5bM=5NeAn=q@mail.gmail.com>
References: <201103090918.47762.berny@dwami.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <201103090918.47762.berny@dwami.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org

2011/3/9 berny=AE <berny@dwami.com>:
> Hi Edward,
> first thank you for your work.
>
> I'm using reiser4 for all my partitions on my working machine with ke=
rnel 2.6.37 with no problems
> except one annoying one that is going on from months.
> When I copy a file (whatever) from one directory to another with konq=
ueror, dolphin or krusader with
> kde 4.6.1 the file get copied, it's size is correct but it is empty.
>
> This happen only in the partitions formatted with reiser4 and not on =
the xfs, reiser3 ones.
>
> If I restart the pc, when I'm back all the files that were empty are =
now ok, it is like on un
> mounting the files get finalized and then on the next boot they are n=
ormally accessible.
> No errors are shown during copy and file system is clean.
> I discovered that this is also signaled like a kde bug 251392 with st=
atus unconfirmed.
>
> If I copy from a terminal with cp, rsync, mc the file get copied corr=
ectly so it is only in the
> combination kde + reiser4 that I get problems.
> Don't know if it is a bug of reiser4 or of kde.
>
> My mount options are no_write_barrier,dont_load_bitmap, the rest is d=
efault, the volumes are normal,
> I mean not cryptocompress.
> An interesting thing, if I format the reiser4 with cryptocompress sup=
port (-o create=3Dccreg40,
> compress=3Dlzo1) this behavior don't happen, I mean the files are cop=
ied correctly so it seems only to
> affect normal uncompressed reiser4 volumes.
> Hope this can be of help to you.
>
> Thank you,
> warm regards,
> Paolo
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

I suspect that it's similar to what I experienced with gnome upgrade
back in time. My problem was due to issues in splice code path which
GNOME switch to for file copying along the way. I already reported
this to GNOME [1] as well as this ML [2,3]. The issue appearing in
only uncompressed partitions is interesting, Edward already asked me
if mine was, which isn't. My current workaround is to use a patched
version of glib (part of gnome libs) that avoids using splice for
reiser4 targets. If you have a KDE bugzilla account, can you also
provide them links for discussions in the list as well as the GNOME
bug?

1: https://bugzilla.gnome.org/show_bug.cgi?id=3D615346
2: http://marc.info/?l=3Dreiserfs-devel&m=3D127096098705179&w=3D2
3: http://marc.info/?l=3Dreiserfs-devel&m=3D129275181431455&w=3D2
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
