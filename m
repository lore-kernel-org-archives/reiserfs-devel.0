From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: How do I recover lost data?
Date: Mon, 24 Nov 2003 15:23:28 +0300
Message-ID: <200311241523.28055.vitaly@namesys.com>
References: <3FC13BB5.108@ffs.gu.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16151-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FC13BB5.108@ffs.gu.se>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mats Hulten <mahu@ffs.gu.se>, reiserfs-list@namesys.com

On Monday 24 November 2003 01:59, Mats Hulten wrote:
> My system froze up, and it turned out to be my reiserfs file system that
> had gone bad.
> I reebooted with the install disks and ran fsck and then reiserfsck
> --rebuild-tree.
> Everything seemed to have worked out just fine, and I could again mount
> the partition, but all data seems to be gone.
>
> All thats left is the /lost+found directory.
> df prints that the hdd is 75% full wich is correct.
>
> What can I do to recover the data?

it seems that most of your data were recovered and liked to lost+found (75% 
of the hdd is full), probably because the root directory was destroyed about 
the freeze time.

-- 
Thanks,
Vitaly Fertman
