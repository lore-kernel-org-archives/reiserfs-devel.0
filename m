From: _evil <evilninja@gmx.net>
Subject: Re: Partial data loss with reiserfs3
Date: Tue, 15 Feb 2005 15:36:13 +0100
Message-ID: <421208DD.1040704@gmx.net>
References: <1108315756.420f8e6ce67b0@webmail.vu.lt>	<200502141544.34513.vitaly@namesys.com> <87fyzyasxv.fsf@quasar.esben-stien.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87fyzyasxv.fsf@quasar.esben-stien.name>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Esben Stien <b0ef@esben-stien.name>

Esben Stien wrote:
> Vitaly Fertman <vitaly@namesys.com> writes:
> 
>>reboot is required between repartitioning a drive and starting to
>>use moved/created partitions.
> 
> Will there ever be an end to this misery?. Is noone planning to fix this?

AFAIK if you partition a harddisk which is not in use (not mounted any 
of its partitions), the kernel is able to re-read the partition table 
(and says so in the syslog). that way i've created partitions on 
harddisks without rebooting.

i think [s|c]fdisk complains, if it can't re-read the table:

The partition table has been altered!
Calling ioctl() to re-read partition table.
WARNING: Re-reading the partition table failed with error 16: Device or 
resource busy.
The kernel still uses the old table.
The new table will be used at the next reboot.
Syncing disks.

Christian.
