From: Nick <nick@njw.me.uk>
Subject: Very slow mounting of unclean partitions
Date: Tue, 18 Dec 2007 14:24:19 +0000
Message-ID: <20071218142419.GB5073@grace.lan>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Hi there,

I currently have three partitions formatted ReiserFS of around 2GB,
600MB and 400MB on my 4GB Compact Flash card. The card is pretty
slow to read and write, with hdparm -Tt giving the following output:

Timing cached reads:   372 MB in  2.01 seconds = 185.40 MB/sec
Timing buffered disk reads:   32 MB in  3.07 seconds =  10.42 MB/sec

This however is acceptable for my purposes, and reiserfs plays
nicely most of the time.

However, if the partitions are unmounted uncleanly for any reason,
remounting all three takes upwards of an hour. This is compared to
an ext3 partition I have on the card, which takes about 10 seconds
to go through the journal and mount.

I get output like the folloing from dmesg after the 1 hour+
mounting, for each partition:

ReiserFS: hdd2: found reiserfs format "3.6" with standard journal
ReiserFS: hdd2: using ordered data mode
ReiserFS: hdd2: journal params: device hdd2, size 8192, journal
  first block 18, max trans len 1024, max batch 900, max commit age
  30, max trans age 30
ReiserFS: hdd2: checking transaction log (hdd2)
ReiserFS: hdd2: replayed 774 transactions in 2318 seconds
ReiserFS: hdd2: Using r5 hash to sort names
ReiserFS: hdd2: Removing [165971 11290 0x0 SD]..done
ReiserFS: hdd2: There were 1 uncompleted unlinks/truncates.
Completed

The relevant fstab entries for the three partitions are (one is
encrypted using LUKS):

/dev/hdd2               /mnt/variable   reiserfs
  noatime,notail  0 0
/dev/hdd5               /mnt/shared     reiserfs
  ro,noatime,notail       0 0
/dev/mapper/home        /home           reiserfs
  noatime,notail  0 0

Could anybody point me in the right direction to find how to
ensure it doesn't take so long to remount? I presume going over
the journal shouldn't take this long.

Thanks for any help or pointers you can give me.


Nick

-- 
GPG Key : www.njw.me.uk/nick.gpg.asc     GPG Key ID: 04E4653F
  GPG Fingerprint: 9732 D7C7 A441 D79E FDF0 94F6 1F48 5674 04E4 653F
