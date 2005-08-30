From: =?ISO-8859-1?Q?Xu=E2n_Baldauf?=
 <xuan--2005.08.22--reiserfs-list--namesys.com@baldauf.org>
Subject: Re: REISERFS_MAX_NAME and ENAMETOOLONG
Date: Tue, 30 Aug 2005 10:33:51 +0200
Message-ID: <431419EF.3040302@baldauf.org>
References: <43099E14.7060902@baldauf.org> <43099FFC.9000606@namesys.com> <43140467.8030704@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25723-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43140467.8030704@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeff Mahoney <jeffm@suse.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

Jeff Mahoney wrote:
> Vladimir V. Saveliev wrote:
> >Hello
>
> >Xu=E2n Baldauf wrote:
> >>Hello,
> >>
> >>when downloading something from java.sun.com (e.g.
> >>http://javashoplm.sun.com/ECom/docs/Welcome.jsp?StoreId=3D22&PartDetail=
Id=3Djdk-1.5.0-doc-oth-JPR&SiteId=3DJSC&TransactionId=3Dnoreg
> >>), very long URLs are encountered. When trying to download using "wget",
> >>wget tries to open a file with those long filenames, and fails with
> >>ENAMETOOLONG (File name too long).
> >>
> >>I think that the limit is due to the REISERFS_MAX_NAME macro
> >>(http://lxr.linux.no/source/include/linux/reiserfs_fs.h?v=3D2.6.10#L110=
7),
> >>which currently resolves to "255" (which supposedly means 255 bytes).
> >>
> >>Is it safe to change REISERFS_MAX_NAME to something larger, or does this
> >>change the disk layout in an unexpected or incompatible way?
> >>
> >Yes. Max long name in reiserfs used to be much longer and then it was
> changed for compilability with something.
> >I believe you can easlily change it to 3500.
>
> Just as a data point:
>
> http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D97908551206263&w=3D2
Interesting story. :-) It also tells how imposed (arbitrary) limits get
spread (by a kind of "limits group dynamics") instead of getting
removed. :-|
>
> The current state:
>
> The kernel doesn't care about the length of a file name, so long as the
> maximum path used to access it is below PATH_MAX (currently 4k). dirents
> are dynamically sized, so there is no more 255 byte limit inside the
> kernel.
>
> Glibc still defines dirent->d_name as char[256] for backward
> compatibility. If the kernel supports d_reclen (which it has for a very
> long time), dirents are treated as dynamically sized. Since glibc
> allocates an 8k (_IO_BUFSIZE) buffer and passes it to sys_getdents,
> proper bounds checking is done, and the max length is supported.
>
> I did a quick test using your suggestion on my development machine, and
> got proper results back.
So even a full userland recompile is not needed anymore in these days,
because the kernel (REISERFS_MAX_NAME) is the only limiting component
(up to the next limit PATH_MAX)?
>
> -Jeff
Xu=E2n.
>
> --
> Jeff Mahoney
> SuSE Labs

