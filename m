From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: reiser4 mount issue
Date: Wed, 3 Sep 2003 14:11:45 +0400
Message-ID: <16213.48737.591215.500942@laputa.namesys.com>
References: <sf5582b5.032@gwia201.syr.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15526-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <sf5582b5.032@gwia201.syr.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Konrad <mkonrad@syr.edu>
Cc: reiserfs-list@namesys.com

Michael Konrad writes:
 > Hello Yury,
 > 
 > This is what occurs in kernel log, when I try the reiser4 mount: 
 > 
 > Sep  3 05:48:14 [kernel]  reiser4[mount(16746)]: get_ready_format40
 > (fs/reiser4/plugin/disk_format/disk_format40.c:229)[nikita-3228]:
 > 
 > Here is the part of my .config file with reiserfs:
 > 
 > CONFIG_REISER4_FS=y
 > # CONFIG_REISER4_FS_SYSCALL is not set
 > # CONFIG_REISER4_LARGE_KEY is not set

Flip CONFIG_REISER4_LARGE_KEY

 > # CONFIG_REISER4_CHECK is not set
 > # CONFIG_REISER4_USE_EFLUSH is not set
 > # CONFIG_REISER4_BADBLOCKS is not set
 > CONFIG_REISERFS_FS=y
 > # CONFIG_REISERFS_CHECK is not set
 > # CONFIG_REISERFS_PROC_INFO is not set
 > 
 > Thank you,
 > Michael
 > 
 > Michael Konrad
 > Systems Administrator
 > College of Visual and Performing Arts
 > Syracuse University
 > >>> Yury Umanets <umka@namesys.com> 09/03/03 01:25 AM >>>
 > On Wed, 2003-09-03 at 05:17, Michael Konrad wrote:

Nikita.

 > 
 > Hello,
 > 
 > 
 > > Compile of linux-2.6.0-test4 with reiser4 is good. 
 > > Compile of libaal-0.4.9 is good
 > > Compile of reiser4fsprogs-0.4.12 is good.
 > > 
 > > mkfs.reiser4 /dev/hda8 is good. 
 > > 
 > > When I issue the following command:
 > > 
 > > mount -t reiser4 /dev/hda8 /mnt/lfs  or
 > 
 > > mount -t reiserfs /dev/hda8 /mnt/lfs 
 > You should not be trying to mount it as reiserfs. Reiser4 is fully
 > different filesystem.
 > > 
 > > I get the following error: 
 > > 
 > > mount: wrong fs type, bad option, bad superblock on /dev/hda8, or too
 > many mounted file systems
 > > 
 > > cat /proc/filesystems 
 > > 
 > > list both reiserfs and reiser4
 > > 
 > > Am I missing something simple here?
 > > 
 > > Thank you,
 > > Michael
 > 
 > You should be aware, that mkfs.reiser4 creates filesystem with large
 > keys by default. What key policy have you turned on when building
 > kernel? And what does kernel log say?
 > 
 > Regards.
 > 
 > 
 > 
