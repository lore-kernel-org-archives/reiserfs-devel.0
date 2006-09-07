From: Ric Wheeler <ric@emc.com>
Subject: Re: FEATURE Req: integrate badblocks check into fsck.reiser*
Date: Thu, 07 Sep 2006 13:10:55 -0400
Message-ID: <4500529F.2040603@emc.com>
References: <ed9tqo$2tc$1@sea.gmane.org> <200609012250.44548.vs@namesys.com>	<44F8B3C8.1050802@slaphack.com> <edae71$iqf$1@sea.gmane.org> <44F8BE78.1080503@slaphack.com> <44FB925E.2000300@emc.com> <44FE1C04.70800@namesys.com> <44FEE45B.4060607@slaphack.com> <44FFF5DB.3050200@emc.com> <4500472F.7050902@slaphack.com>
Reply-To: ric@emc.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29824-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4500472F.7050902@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Hans Reiser <reiser@namesys.com>, Peter <sw98234@hotmail.com>, reiserfs-list@namesys.com

David Masover wrote:
> Ric Wheeler wrote:
>>
>> I think that you are missing the way modern drives behave.  To give a 
>> typical example, on a 300 GB drive, we typically have 2000 or more 
>> extra sectors that are used for automatic remapping.  Theses sectors 
>> are consumed only when the drive retries a failed write multiple times.
> 
> 
> Oh, I'm not disputing that mkfs should discourage users from using 
> broken drives.  Presumably, smart admins wouldn't see this often, 
> because they'd be monitoring SMART.
> 
>> We really, really do not need a list of bad blocks to avoid during 
>> writing a new file system image.
> 
> 
> Why do you presume to make this decision for users?

It's not a decision that I want to make for users, it is a decision that 
Hans and his team need to make about how best to spend their limited 
resources.

Allowing users to put down reiser3/4 file systems on crap drives takes 
effort on their part and will result in an increased work load.

It will also give more users a bad experience with the file system, 
since users rarely have the in depth knowledge required to make this 
kind of choice.

> 
> I don't think we need CONFIG_LEGACY_PTYS -- they're insecure, and almost 
> never needed.  But we should still leave them in.  The burden is on us 
> to show that it's taking real work to implement and maintain.

This is a request for a new feature to allow users to do something, by 
design, that is extremely likely to lose all of their data. Not to 
extend support for an existing (braindead) legacy.

> 
>> I think that the more interesting case is handling bad blocks during 
>> recovery.  It is not clear to me that fsck needs a list, but we have 
>> worked with Hans and Vladamir to get support for doing a reverse 
>> mapping (given a list of bad blocks, show the user what files, etc got 
>> hit).
> 
> 
> Yes, it seems like fsck would be much better off that way.  In this 
> case, of course, I'd prefer to avoid hitting that problem -- use RAID, 
> make regular backups, toss out the disk and restore.  Being able to 
> "repair bad blocks" would tend to encourage a user to keep using a bad 
> disk, but I don't want to force my opinion on everyone when there's a 
> reasonable way for all of us to be happy.

Here we mostly agree.  The need for enhanced tools is not to encourage 
people to keep using bad drives, rather to allow them to fsck & remount 
a drive for data recovery.  If you cannot mount & fsck fails to repair 
enough to give you at least a readable file system, then you are in real 
trouble ;-)

Also, unlike failing writes, disk read errors are quite often ephemeral 
and will be self correcting on the next write (you might get an error 
from dust, etc that gets "swept" clean on the next write).



