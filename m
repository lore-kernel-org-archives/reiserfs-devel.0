From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Deleting a 5 GB directory in Reiser4 hangs system(s)
Date: Sat, 26 Jul 2014 11:56:16 -0700
Message-ID: <CAM12Q5TqhZej_mehnmbvRx8vayd74HjBstEUewmXHKvbVXX=rQ@mail.gmail.com>
References: <CAM12Q5RGOuEMyVhTPcVcLDGAri6H9-NbBKOF2T_PXfq0=kMVoQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAM12Q5RGOuEMyVhTPcVcLDGAri6H9-NbBKOF2T_PXfq0=kMVoQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Additional information on recursively removing a directory of
approximately 5 GB on a Reiser4-formatted partition:

If existing data directory of that size is copied over to a Reiser4
converted system, i.e.,
cp -a /mnt/intermediate-directory-data/*  /mnt/newly-created-reiser4/.

then attempting to recursively remove a directory of the size in
question (or even much smaller!) hangs the system. It does not matter
if the partition is mounted to accomplish the rm -r
/mnt/other-partition/5GB-data operation. Even booting from a Reiser4
capable media like the one I created <
https://sourceforge.net/projects/xonecuiltzin/ > and mounting the
target partition of the hard drive and executing rm -r does hang the
machine.

On the other hand, if that much data is created by the running Reiser4
system (i.e., downloading/operating on source for building a custom
Xorg distribution, for instance) then there is no problem using rm -r
to delete recursively that much data.

On Thu, Jul 24, 2014 at 4:24 AM, Jose R R <Jose.r.r@metztli-it.com> wrote:
> Niltze!
>
> I have a couple of root partitions with Debian which recently have
> been default-formatted with Reiser4.
>
> I have applied at the very least Mahoney's patch set (<
> http://marc.info/?l=reiserfs-devel&r=1&b=201404&w=2 >) followed by
> reiser4 for 3.14.1 patch (<
> http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x/
>>) on kernels 3.14.4 and 3.15.2. Each kernel operates in a different
> OS with reiser4 root fs.
>
> Attempting to remove a ~ 5 GB directory recursively (rm -r) the
> operation hangs either system.
>
> Has the bug has been reported before? Or is it a feature ;-)
>
> Cheers!
>
[...]


-- 
Jose R R
http://www.metztli-it.com
---------------------------------------------------------------------------------------------
NEW Apache OpenOffice 4.1.0! Download for GNU/Linux, Mac OS, Windows.
---------------------------------------------------------------------------------------------
Daylight Saving Time in USA & Canada ends: Sunday, November 02, 2014
---------------------------------------------------------------------------------------------
