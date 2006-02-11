From: Bernd Schubert <bernd-schubert@gmx.de>
Subject: Re: 2.6.15 Bug? New security model?
Date: Sun, 12 Feb 2006 00:50:30 +0100
Message-ID: <200602120050.31345.bernd-schubert@gmx.de>
References: <200602080212.27896.bernd-schubert@gmx.de> <20060208221124.GN30803@sorel.sous-sol.org> <20060212005541.107f7011.vsu@altlinux.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28075-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060212005541.107f7011.vsu@altlinux.ru>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Sergey Vlasov <vsu@altlinux.ru>
Cc: Chris Wright <chrisw@sous-sol.org>, John M Flinchbaugh <john@hjsoft.com>, reiserfs-list@namesys.com, Sam Vilain <sam@vilain.net>, linux-kernel@vger.kernel.org

Privet!

> > > Yes, 2.6.13 now makes the same trouble. No difference with 2.6.15.3.
> > > I played with mount -o noattrs, this makes no difference with 2.6.13,
> > > but has some effects to 2.6.15.3. Creating files in /var/run is
> > > possible again, lsattr gives "lsattr: Inappropriate ioctl for device
> > > While reading flags on /var/run", but deleting files in /var/run is
> > > still impossible (still rather bad for the init-scripts).
>
> Is the filesystem in question old - could it be created initially in the
> reiserfs v3.5 format (used with 2.2.x kernels) and later converted to
> v3.6 (by mounting with the "conv" option)?

Well, I'm rather sure I created this filesystem in May 2001 after the Win20=
00=20
partion manager selectively deleted all my ext2 partitions (I'm still very=
=20
angry about MS). However, that time I already knew that v3.5 should not be=
=20
used with NFS and I always used NFS a lot(my first mail to the reiser list=
=20
was in early 2001 about a reiser v3.5 + nfs problem). I also used=20
Slackware-8.0-pre that time and also just checked it, the mkreiserfs from=20
slackware-8.0 has v3.6 as default. So really, its very unlikely that my=20
current root partition ever had v3.5 on it.

>
> > Yes, that's what I thought.  There's still some backward logic in there.
> > noattrs vs. attrs triggers whether the code path that's patched in
> > 2.6.15.3 is taken.  I'll dig a bit more, but hopefully the reiserfs fol=
ks
> > can fix this for us.
>
> Here is a simple test case which reproduces the problem with a
> filesystem converted from v3.5:
>
> # dd if=3D/dev/zero of=3Dtmp.img bs=3D1M count=3D100
> # mkreiserfs --format 3.5 -f tmp.img
> # mount -t reiserfs -o loop,conv tmp.img /mnt/disk/
> # umount /mnt/disk/
> # reiserfsck --clean-attributes tmp.img
> # mount -t reiserfs -o loop tmp.img /mnt/disk/
>
> At this point, I get obviously wrong attributes on /mnt/disk:
>
> # lsattr -d /mnt/disk/
> -----a--c---- /mnt/disk/
>
> BTW, this breaks even with kernels earlier than 2.6.15.2, if you also
> add the "attrs" options to the last mount command.
>
> Apparently the reiserfs attrs code has been broken for such converted
> filesystems for some time, but it could be enabled only with the "attrs"
> option, so people were not hitting this.  However, the following patch:
>
> http://www.kernel.org/git/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=
=3Dcomm
>it;h=3D2949ccf9379678df66ecf2ca70ed4656159eacdd
>
> changed the logic to enable the "attrs" option on all filesystems which
> have the reiserfs_attrs_cleared flag.  But that patch was broken - it
> did not really set the option properly, so the attrs-related breakage
> did not became visible until yet another patch:
>
> http://www.kernel.org/git/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=
=3Dcomm
>it;h=3Dd35c602870ece3166cff3d25fbc687a7f707acf3
>
> which later made into 2.6.15.2, and caused problems for some people.

I already reverted the patch in 2.6.15.2 for some NFSv4 tests with 2.6.15, =
but=20
of course, this is not the final solution. Neither for me, nor for the othe=
r=20
thousands of reiserfs filesystems out there, that suddenly break beginning=
=20
with 2.6.15.2.


>
> I have noticed that fs/reiserfs/inode.c:init_inode() does not initialize
> REISERFS_I(inode)->i_attrs and inode->i_flags (as done by
> sd_attrs_to_i_attrs()) in the branch for v1 stat data; maybe this causes
> the problem?

Please forgive me my missing knowledge about the internals of reiserfs,=20
reiserfs doesn't have an inode for each file and directory as ext2, right?
Is there some way to detect if the inode was created on reiser3.5?

Thanks,
	Bernd

=2D-=20
Bernd Schubert
PCI / Theoretische Chemie
Universit=E4t Heidelberg
INF 229
69120 Heidelberg

