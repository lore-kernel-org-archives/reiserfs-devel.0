From: "Bill Rees" <wsrees@gmail.com>
Subject: Bad Hardware / Software Disk Detection for Production Systems
Date: Fri, 2 Jun 2006 08:21:12 -0400
Message-ID: <8bdd70ae0606020521o177b840eya5580b511f3526a3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_1234_4501996.1149250872690"
Return-path: <reiserfs-list-return-28715-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_Part_1234_4501996.1149250872690
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

This is a general question but I thought I'd post it to the list to see if
anyone has any suggestions.

We have some production systems running SUSE 9.3 and reiserfs that are very
IO intensive using 3ware controllers in JBOD mode for the high throughput.
On occasion we will have a disk problem that bringst the system to a virtual
standstill. Ususally the problems cause an eventual system lockup that can't
even be resolved with a software reboot. One has to hit the reset switch to
get the system back and then take the offending disk offline. Usually there
are tons of errors from the kernel indicating drive problems. 90% of the
time the failure is due to a hardware issue with the drive running out of
spare sectors but sometime it is a filesystem corruption issue. I am looking
for a way to prevent the system lockup.

Is there a way to accomplish this without RAID 5? We have the smartmon utils
installed on all of our systems and most times even setting a drive to be
fsck'ed on reboot does nothing when a system boots. Ideally, I'd just like
to recognize when a disk might be having issues, stop using it, and then
notify someone to manually check into it.

Is there a quick and dirty check to determine if a reiserfs disk is hosed on
boot? Setting a flag in fstab doesn't seem to do the trick. I'd be willing
to write a custom mount script to accomplish this as well.

Any input would be appreciated.

thanks,
Bill Rees

------=_Part_1234_4501996.1149250872690
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,<br><br>This is a general question but I thought I'd post it to the list to see if anyone has any suggestions.<br><br>We have some production systems running SUSE 9.3 and reiserfs that are very IO intensive using 3ware controllers in JBOD mode for the high throughput. On occasion we will have a disk problem that bringst the system to a virtual standstill. Ususally the problems cause an eventual system lockup that can't even be resolved with a software reboot. One has to hit the reset switch to get the system back and then take the offending disk offline. Usually there are tons of errors from the kernel indicating drive problems. 90% of the time the failure is due to a hardware issue with the drive running out of spare sectors but sometime it is a filesystem corruption issue. I am looking for a way to prevent the system lockup.
<br><br>Is there a way to accomplish this without RAID 5? We have the smartmon utils installed on all of our systems and most times even setting a drive to be fsck'ed on reboot does nothing when a system boots. Ideally, I'd just like to recognize when a disk might be having issues, stop using it, and then notify someone to manually check into it.
<br><br>Is there a quick and dirty check to determine if a reiserfs disk is hosed on boot? Setting a flag in fstab doesn't seem to do the trick. I'd be willing to write a custom mount script to accomplish this as well.<br>
<br>Any input would be appreciated.<br><br>thanks,<br>Bill Rees<br>

------=_Part_1234_4501996.1149250872690--
