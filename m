From: Yury Umanets <umka@namesys.com>
Subject: Re: reiser4 mount issue
Date: Wed, 03 Sep 2003 09:23:28 +0400
Message-ID: <1062566608.2107.7.camel@haron.namesys.com>
References: <sf55090d.092@gwia201.syr.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15523-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <sf55090d.092@gwia201.syr.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Konrad <mkonrad@syr.edu>
Cc: reiserfs-list@namesys.com

On Wed, 2003-09-03 at 05:17, Michael Konrad wrote:

Hello,


> Compile of linux-2.6.0-test4 with reiser4 is good. 
> Compile of libaal-0.4.9 is good
> Compile of reiser4fsprogs-0.4.12 is good.
> 
> mkfs.reiser4 /dev/hda8 is good. 
> 
> When I issue the following command:
> 
> mount -t reiser4 /dev/hda8 /mnt/lfs  or

> mount -t reiserfs /dev/hda8 /mnt/lfs 
You should not be trying to mount it as reiserfs. Reiser4 is fully
different filesystem.
> 
> I get the following error: 
> 
> mount: wrong fs type, bad option, bad superblock on /dev/hda8, or too many mounted file systems
> 
> cat /proc/filesystems 
> 
> list both reiserfs and reiser4
> 
> Am I missing something simple here?
> 
> Thank you,
> Michael

You should be aware, that mkfs.reiser4 creates filesystem with large
keys by default. What key policy have you turned on when building
kernel? And what does kernel log say?

Regards.


