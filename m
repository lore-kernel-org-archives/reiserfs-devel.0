From: Hans Reiser <reiser@namesys.com>
Subject: Re: short term task list for Reiser4
Date: Sun, 16 Jul 2006 00:16:36 -0700
Message-ID: <44B9E7D4.7060000@namesys.com>
References: <44B42064.4070802@namesys.com>	<20060714052601.GA28835@rvalles.homedns.org.>	<44B7415D.6020305@namesys.com> <20060714195553.15e8c919@holly.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29011-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060714195553.15e8c919@holly.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jindrich Makovicka <makovick@gmail.com>
Cc: reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

Jindrich Makovicka wrote:

>On Fri, 14 Jul 2006 00:01:49 -0700
>Hans Reiser <reiser@namesys.com> wrote:
>  
>
>>rvalles wrote:
>>    
>>
>>>I believe those two are related. I'm having the "pauses" (of many
>>>minutes at times!) when writing to reiser4. It seems it is triggered
>>>mostly by the use of fsync(); NFS in sync mode manages to trigger it
>>>way often: I mount my old desktop's home from my new computer via
>>>synced NFS.
>>>The pauses consist in the application being frozen and the other
>>>applications being slowed down on their IO operations, while the
>>>disks writes data continously during an interval that usually last a
>>>minute or so, but may last many times that. It often happens with
>>>small files (like, when sending a mail, as it passes through the
>>>MTA), so I believe it probably (re)writes to disk lots of stuff that
>>>doesn't need to be written to disk at all.
>>>It only happens on reiser4 patches against 2.6.13 or newer, 2.6.12.x
>>>is fine.
>>> 
>>>
>>>      
>>>
>>So the pauses are experienced by a process waiting on fsync to finish?
>>If yes, then the problem is a very different issue from what I
>>thought....
>>    
>>
>
>I am pretty sure I triggered the same a couple of times with aMule,
>which was downloading and uploading about 20-30kB per second in each
>direction, and randomly accessing larger files. Doing a sync then
>suddenly caused the disk seek like crazy and write about 500kB per
>second constantly. I waited about a minute, and then better killed
>aMule. Could it be possible that sync tries to sync the writes which
>arrive during the operation and cannot catch up?
>
>  
>
zam, can you answer this, because he is right that if the answer is yes,
then we have a bit of a problem we need to address.  I worry that,
assuming the answer is yes, that one process doing a lot of fsync, could
muck up the performance of everyone its atoms fuse with if we expire the
atom with every fsync, but if we don't then.....

Jindrich, don't let us forget this issue before we fix it, ok?  Thanks,

Hans
