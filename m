From: Max Power <ratty@they.org>
Subject: Re: (yet another) attempt to access beyond end of
 device
Date: Wed, 21 Aug 2002 02:26:18 -0700 (PDT)
Message-ID: <Pine.LNX.4.33L2.0208210204460.16503-100000@ns.they.org>
References: <20020821124007.A12576@namesys.com>
Reply-To: <ratty@they.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11267-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020821124007.A12576@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Wed, 21 Aug 2002, Oleg Drokin wrote:

# Hello!
#
# On Wed, Aug 21, 2002 at 01:28:12AM -0700, Max Power wrote:
# > Not looking for solutions, just delivering a bug report.
# > I have a 30GB Seagate with one partition on it formatted ReiserFS (version
# > 3.6.25 apparently) on which some CDROM images reside. Kernel 2.4.18
# > (mandrake).
# >
# > When I try to read the files I get the following type of messages in my
# > syslog:
# > Aug 20 19:28:28 stroke kernel: attempt to access beyond end of device
# > Aug 20 19:28:28 stroke kernel: 16:41: rw=0, want=471759240, (=0x1c1e7988), limit=471759240
# > Aug 20 19:33:57 stroke kernel: attempt to access beyond end of device
# > Aug 20 19:33:57 stroke kernel: 16:41: rw=0, want=623828640, (=0x252edea0), limit=623828640
# > Aug 20 19:36:19 stroke kernel: attempt to access beyond end of device
# > Aug 20 19:36:19 stroke kernel: 16:41: rw=0, want=1685807688, (=0x647b6248), limit=1685807688
# > Aug 21 00:33:34 stroke kernel: attempt to access beyond end of device
# > Aug 21 00:33:34 stroke kernel: 16:41: rw=0, want=1758259028, (=0x68cce754), limit=1758259028
# > Aug 21 00:33:38 stroke kernel: attempt to access beyond end of device
# > Aug 21 00:33:38 stroke kernel: 16:41: rw=0, want=389077160, (=0x1730d8a8), limit=389077160
# > Aug 21 00:33:46 stroke kernel: attempt to access beyond end of device
# > Aug 21 00:33:46 stroke kernel: 16:41: rw=0, want=1411977092, (=0x54290f84), limit=1411977092
#
# > I've tried all manor of reiserfscking repeatedly. Each time it seems to
# > fix something different. I've read about the issues with fdisk and not
# > rebooting and admit that this _could_ be my issue but that doesn't explain
# > why all the "want" and "limit" numbers are identical. I'm also curious why
#
# What do you mean by "identical"? I see they are different each time and this is
# very strance since limit should be always the same.

I was referring to the per-line sameness. In some of the mail list
archives I looked thru the "want" number was different than the "limit"
number each time. Mine are the same. And I don't get why if I "want" X and
the "limit" is X then why can't I have X?

# > upon umount/mounting the partition the location where the read fails
# > changes.
#
# This is also very strange.
# Are you sure your hardware correctly delivers data? Have you verified that?

The main files I was trying to copy were tar.gz's and they passed a "gzip
-t" after I did the cat maneuver. So yes, the data is moving. From my
perspective it's the FS. But I'm neither a hard-disk nor FS expert so
don't take my word for it. The iso files I cat'd across mounted up ok too.
Haven't tried burning one to disk yet. I tried running "find /mnt/disk
-type f | xargs cat > /dev/null" assuming that it would actually cat every
file within the iso image. No errors were displayed for those operations.

I've been using this drive quite reliably for about a year and a half. The
only problems seem to be with the very-large (~300MB - 2GB) files.

# > I was able to retreive my data but I couldn't tell you why it worked. To
# > do so, I umount/mount'd the partition then cat'd the iso file to
# > /dev/null. THEN I was able to cat the files and redirect them to new files
# > on a different disk. If I try to "copy" 2 files in a row without a
# > umount/mount I get the I/O errors right away. A plain old 'cp' never
# > worked right. Had to do the cat trick for every file.
#
# I'd suspect hardware problems first.
#
# > BTW, that problem with the fdisk and not rebooting... Is there any way you
# > can code reiserfsck so it will tell you that you screwed it up? How can I
#
# Not easily.
#
# > know if I did it right or not at this point?
#
# If fdisk told you ioctl to reread partition table failed, you need to reboot.
# Hard to tell it later.
#
# Bye,
#     Oleg
#

Thanks for the quick response!
-Frank

-- 
Nobody snuggles with Max Power.  You strap yourself in and feel the "G"s!

