From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Very slow mounting of unclean partitions
Date: Tue, 18 Dec 2007 10:56:51 -0500
Message-ID: <4767EDC3.5090301@suse.com>
References: <20071218142419.GB5073@grace.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20071218142419.GB5073@grace.lan>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick <nick@njw.me.uk>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Nick wrote:
> Hi there,
> 
> I currently have three partitions formatted ReiserFS of around 2GB,
> 600MB and 400MB on my 4GB Compact Flash card. The card is pretty
> slow to read and write, with hdparm -Tt giving the following output:
> 
> Timing cached reads:   372 MB in  2.01 seconds = 185.40 MB/sec
> Timing buffered disk reads:   32 MB in  3.07 seconds =  10.42 MB/sec
> 
> This however is acceptable for my purposes, and reiserfs plays
> nicely most of the time.
> 
> However, if the partitions are unmounted uncleanly for any reason,
> remounting all three takes upwards of an hour. This is compared to
> an ext3 partition I have on the card, which takes about 10 seconds
> to go through the journal and mount.
> 
> I get output like the folloing from dmesg after the 1 hour+
> mounting, for each partition:
> 
> ReiserFS: hdd2: found reiserfs format "3.6" with standard journal
> ReiserFS: hdd2: using ordered data mode
> ReiserFS: hdd2: journal params: device hdd2, size 8192, journal
>   first block 18, max trans len 1024, max batch 900, max commit age
>   30, max trans age 30
> ReiserFS: hdd2: checking transaction log (hdd2)
> ReiserFS: hdd2: replayed 774 transactions in 2318 seconds
> ReiserFS: hdd2: Using r5 hash to sort names
> ReiserFS: hdd2: Removing [165971 11290 0x0 SD]..done
> ReiserFS: hdd2: There were 1 uncompleted unlinks/truncates.
> Completed
> 
> The relevant fstab entries for the three partitions are (one is
> encrypted using LUKS):
> 
> /dev/hdd2               /mnt/variable   reiserfs
>   noatime,notail  0 0
> /dev/hdd5               /mnt/shared     reiserfs
>   ro,noatime,notail       0 0
> /dev/mapper/home        /home           reiserfs
>   noatime,notail  0 0
> 
> Could anybody point me in the right direction to find how to
> ensure it doesn't take so long to remount? I presume going over
> the journal shouldn't take this long.
> 
> Thanks for any help or pointers you can give me.

It depends what kernel version you're using. Versions without dynamic
bitmaps would read all the bitmaps on boot. Replaying the journal means
that it's reading up to 32 MB of disk and then writing it out to
essentially random places, though seeks aren't so much of an issue on
flash media.

It definitely shouldn't take an hour, but you really haven't given
enough information to guess any further.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFHZ+3DLPWxlyuTD7IRAk2lAJwLzyfvJ+RTv6Er0R2uo9gDcu0z2wCgjjVe
yMAYJeoOFWGDDYkXIeVeU0Q=
=4zYl
-----END PGP SIGNATURE-----
