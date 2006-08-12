From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe@gramoulle.com>
Subject: Re: A Word of Warning about Linux Software Raid
Date: Sat, 12 Aug 2006 14:33:41 +0200
Message-ID: <20060812123342.BEFC03BE@philou.gramoulle.local>
References: <1155319786.8121.43.camel@localhost.localdomain>
	<20060811213450.cf67e32e.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29582-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060811213450.cf67e32e.reiser4@blinkenlights.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hello,

On Fri, 11 Aug 2006 21:34:50 +0200
Adrian Ulrich <reiser4@blinkenlights.ch> wrote:

  | > It seems that the kernel does not check the integrity of the data on mirrored raid,  
  | 
  | It does if you tell the kernel to do so:
  | 
  | # echo check > /sys/block/md0/md/sync_action 

I have just upgraded from an older kernel to be able to use such a functionality but :

boogie:~# cat /proc/mdstat
Personalities : [linear] [raid0] [raid1] [raid5] [raid4] [raid6] [multipath] 
md0 : active raid0 sde1[0] sdk1[6] sdj1[5] sdi1[4] sdh1[3] sdg1[2] sdf1[1]
      501773440 blocks 64k chunks
      
unused devices: <none>

boogie:~# echo check > /sys/block/md0/md/sync_action
-bash: /sys/block/md0/md/sync_action: Permission denied

boogie:~# mount | grep sys
sysfs on /sys type sysfs (rw)

What am i missing here ?

Thanks,

Philippe
