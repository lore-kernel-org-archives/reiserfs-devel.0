From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck 3.6.11 locks up
Date: Mon, 22 Dec 2003 14:41:07 +0300
Message-ID: <200312221441.07493.vitaly@namesys.com>
References: <196401c3c7c6$3ff2e1c0$74cb010a@mail2world.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16370-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <196401c3c7c6$3ff2e1c0$74cb010a@mail2world.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Fendrich <david@fendrich.net>, reiserfs-list@namesys.com

Hello, 

On Sunday 21 December 2003 16:27, David Fendrich wrote:
> I have a disaster on my hands. I have important data on a HD which
> crashed a few days ago. It turns out that the back up system has been
> down for 1 month, so I really need to recover data from this HD. I used
> dd_recover to rescue what I could to a clean drive (very few blocks were
> damaged, fortunately).
>
> I then mounted this 200 gig file with losetup and ran reiserfsck --check
> on it. Reiserfsck said that I needed to run with --rebuild-tree. So I
> did. Pass 0 went fine. Pass 1 locked up everything after 40%. I
> downloaded the latest reiserfsck (my first version was 3.6.6 or
> something like that) and tried again. Same result at the exakt same
> position.

So reiserfsck continues to do smth but no progress anymore, right?
Have you built the progs on the same computer where you run it?
Would you check your memory with memtest or similar?
If this is a problem in the reiserfsprogs code I will be able to find 
it if you run 
	debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2
and make it available for downloading.

> I am almost certain that there is nothing wrong with the new HD, so what
> am I to do?
>
> Is is wrong to run from a loopback device? Should I copy the large file

this is ok to fsck the loopback device, you can even fsck the file.

> right on to an empty partition with dd if=/dev/loop0 of=/dev/hda1 -bs=1M
> ? Does it matter on hda1 is larger than the original partition?

in this case it would be better to zero the partition first or to be sure that there
were no reiserfs before on hda1 blocks that lie over the fs size.

> If the output from debugreiserfs helps, here it is:
> debugreiserfs 3.6.11 (2003 www.namesys.com)
>
> Count of blocks on the device: 49520336
> Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
> blocks): 49520336

have you rebuilt the super block? 

-- 
Thanks,
Vitaly Fertman
