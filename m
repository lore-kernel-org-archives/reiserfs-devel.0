From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: vs-7000 errors after disks forced online in a RAID5 HW setup
Date: Wed, 19 May 2004 01:49:33 +0200
Message-ID: <20040519014933.4d9b5d3e@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18755-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-list@namesys.com>


 Hello,

Yesterday, we were hit with a hardware failure that left us with no choice that forcing a failed disk online
, in a HW RAID5 setup on one of our NFS server.

Now, logs are filled with :

vs-7000: search_by_entry_key: search_by_key returned item position == 0<4>zam-7001: io error in reiserfs_find_entry
vs-7000: search_by_entry_key: search_by_key returned item position == 0<4>zam-7001: io error in reiserfs_find_entry
vs-7000: search_by_entry_key: search_by_key returned item position == 0<4>zam-7001: io error in reiserfs_find_entry

etc...

Can i skip the reiserfsck --check and do directly a reiserfsck --rebuild-tree ?
(around 470Go of data , 70% of the available space)

Thanks,

Philippe
