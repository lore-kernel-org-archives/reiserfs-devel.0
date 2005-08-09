From: michael chang <thenewme91@gmail.com>
Subject: Re: reiser4 performance
Date: Tue, 9 Aug 2005 13:52:49 -0400
Message-ID: <b14e81f0050809105257e10358@mail.gmail.com>
References: <dd7cbn$kbg$1@sea.gmane.org>
	 <200508081409.03814.rmeijer@internet.gr> <42F7B8F4.80101@slaphack.com>
	 <42F7D77E.5080108@namesys.com> <42F7F28B.7010602@slaphack.com>
	 <b14e81f0050808171622aeb433@mail.gmail.com>
	 <42F8008A.6000300@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25373-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F8008A.6000300@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Hans Reiser <reiser@namesys.com>, "Raymond A. Meijer" <rmeijer@internet.gr>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

On 8/8/05, David Masover <ninja@slaphack.com> wrote:
> michael chang wrote:
> > On 8/8/05, David Masover <ninja@slaphack.com> wrote:
> >
> >>Hans Reiser wrote:
> >>
> >>>David Masover wrote:
> >>>
> >>>>Raymond A. Meijer wrote:
> >>>>
> >>>>>On Monday 8 August 2005 13:32, Hemiplegic Menehune wrote:
> >>>>>
> >>>>>>Its already as stable as any other fs on my systems and recovers
> >>>>>>better than most when my battery runs out. Any idea when it will ma=
ke
> >>>>>>it into the stable 2.6 kernel?
> >>>>>
> >>>>>If only it had a resizer :(
> >>>>
> >>>>Resizer isn't such a big deal.  I can usually find enough backup for
> >>>>enough of what I want, and I usually get sizes right the first time.
> >
> >
> > I want a resizer (or at least a converter so I can convert to
> > ResierFS, resize, and reconvert back) because I have a dual-boot WinXP
> > and Linux/ReiserFS 3.6 system, which I really want to convert to
> > Reiser4.
>=20
> That's about my situation.
>=20
> > I don't mind putting XP on a FAT partition so I can squeeze
>=20
> Dear God, no!  Learn to use ntfsresize.  It doesn't even require that
> you defragment first -- it will defragment an NTFS partition in order to
> shrink it, then set a flag that tells Windows to run its equivalent of
> fsck on the next boot.

But the start of a NTFS parition is fixed.  So is that of ResierFS
3.6, in parted.  Besides, when my hard drive is 99% full and all the
files that need to be defragmented are in the MFT area, I really think
FAT is saner.  I had that happen to me before.  Honest.

> The only reason for using VFAT would be if you have a lot of large files
> shared between Windows/Linux -- Captive is slow.  But I'd rather have a
> fast Windows and a slow (mostly unused) Captive any day.

I have yet to get Captive working.  I use a plain Debian install.  I'm
kinda waiting for Ubantu disks in the mail -- I'll experiment with
those later. In the meantime, still running unstable Debian.  *sighs*

> I eventually figured out how to resize stuff properly.  But, what I'd
> like to be able to do is grow any partition both ways.  I don't care so
> much about ntfsresize, since I keep my Windows partition near the front
> of the disk (to boost the speed of Windows -- for Linux, I have Reiser),

Obviously, you and I have different opinions to solve the same
problem.  Since I try and squeeze around 17 GBs or so of stuff on 2
partitions on a 20 GB disk, then I have loads of problems.  At this
rate, I'm going to put /boot on a ext2 partition at the top, then put
in a Reiser4 partition, then my FAT windows partition.

FAT seems to defragment easier than NTFS when full.  Emphasis on the
full bit.  My partitions are always full, never empty.  No time.  Why?
 Because I don't have a CD/DVD burner to offload stuff.  That's why.

> but I'd like to be able to move the beginning of the FS -- either
> backwards, to grab unused Windows space, or forwards, to give space back
> to Windows.

I used to do this.  Then I found that Ext2 and ResierFS's beginnings
won't budge.  So I just tacked my FAT partition at the end.  Who needs
Windows anyways?  At the rate it was going, there wouldn't have been a
performance gain putting it at the beginning.  I spend most of my time
in Linux.

> But, without that, there's always LVM.  It will fragment your partition,
> at a level below the FS, but it will let you grow and shrink stuff any
> way you like, including onto new devices.  But I don't do that, because
> I doubt I'm wrong about how much each will grow, and I like performance
> and software RAID, neither of which is easy with LVM.

But I hate trying to do this while keeping my siblings' files and my
parents' files on the same disk.  And I absolutely HATE software
raid/LVM.  Which is why I don't use it.  Fragmentation is my worse
enemy, and I'd spend two days defragmenting a computer if I need to.=20
[I just did, and it's still half fragmented; mostly due to files that
take up about 1/100th of the disk or so.]

> different heads, there's a striped RAID -- also within reach of a
> desktop power user like myself.

Striped RAID only works if you have multiple disks and a decent bus.=20
I'm stuck on the lowest-end Dell Dimension 3000, with one of the
slowest hard drives in history.  And I haven't gotten around to
opening the case... yet.

Every consumer has different values, and different approaches.  Some
are still as stubborn as a mule, and you have to accomidate for them,
or lose them.

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
