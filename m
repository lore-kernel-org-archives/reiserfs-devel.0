From: Jos Houtman <jos@hyves.nl>
Subject: improving Reiserfs Performance
Date: Wed, 25 May 2005 14:54:33 +0200
Message-ID: <42947589.2020707@hyves.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24140-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello list,

First of all, We are a website that provide picture albums to its users.
At moment we host almost 2 million, which are served in 5 different 
formats from icons to 700x500.
We store all there files on our NAS server and serve these with SQUID 
proxys.

But we are having performance problems, and I'am orientating myself for 
possible fields of improvement.

Our setup is as follows.
A dual 2Ghz xeon, with 1 GB memory.
2x  3ware 9000 cards with 8 SATA disks each.
  - Each disk set is configured for raid 5 with one hot spare disk.
    This gives us 2x 2.2TB partitions, of which we use about 500GB, but 
keeps growing.

Our directory structure is as follows:
/mnt/raid1/ORIGINALS/ (original uploaded picture's only used for rendering)
/mnt/raid1/RENDERED/  (Resized foto's)

in each of these directory's we create a subdirectory per 50.000 photo's.
1-50000, 50001-100000, etc.

This means that ORIGINALS subdirs contains 50.000 files max,
but the RENDERED subdir's contain 250.000 (5x50.000) files maximal.
We resize the picture's on demand so the actual amount is variable.
Avarage file size of the rendered files is i think are 20 to 25KB.

In peak hours about 50 to 100 files per sec are read requested over NFS.
what percentage is write i dont know, but i would guess about 10 to 20%.
This seems to be too much for the server, and therefor iam trying to 
improve things.

I'am anything but an expert on filesystems and disks, so maybe i got 
some weird idea's
but iam going to shoot them in the hope that some of your experience 
rubs of on me.
Possible ideas i had:
- Changing to raid10, this should improve read performance.
- switching to reiserfs4, the benchmark on the site showed improvement. 
but is it stable enough yet?
- moving the reiserfs journal to another device (will this matter?)
- changing journal size?
- Changing the amount of picture's in a subdir?
  Is there a optimal amount after which it would be better to create 
more top dirs?
- caching of the directory structure in memory?
- More memory so that linux can cache more, but i dont really think this 
will help because a wide variaty of files is requested and not much 
files are requested twice.
- changing the setup into more (smaller) disk arrays and dividing the 
files over these. (but how to provide a consistent view? like it is now)

Do you guys/girls have additional idea's? (Maybe our setup is totally wrong)

Iam happy to provide more details if necessary.


-Bows-

Jos Houtman




