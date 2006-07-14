From: Hans Reiser <reiser@namesys.com>
Subject: Re: short term task list for Reiser4
Date: Fri, 14 Jul 2006 00:01:49 -0700
Message-ID: <44B7415D.6020305@namesys.com>
References: <44B42064.4070802@namesys.com> <20060714052601.GA28835@rvalles.homedns.org.>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28998-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060714052601.GA28835@rvalles.homedns.org.>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rvalles <rvalles@es.gnu.org>
Cc: reiserfs-list@namesys.com

rvalles wrote:

>On Tue, Jul 11, 2006 at 03:04:20PM -0700, Hans Reiser wrote:
>  
>
>>Please feel free to comment on this list and the order of its tasks:
>>4) review complaints of pauses while using reiser4 --- size of task
>>unknown, and it is also unknown how much we may have fixed it while
>>writing recent patches.
>>
>>6) optimize fsync --- substantive task which requires using fixed area
>>for write twice logging, and using write twice logging for fsync'd
>>data.  It might require creating mount options to choose whether to
>>optimize for serialized sequential fsyncs vs. lazy fsyncs.
>>
>>    
>>
>I believe those two are related. I'm having the "pauses" (of many
>minutes at times!) when writing to reiser4. It seems it is triggered
>mostly by the use of fsync(); NFS in sync mode manages to trigger it
>way often: I mount my old desktop's home from my new computer via synced
>NFS.
>The pauses consist in the application being frozen and the other
>applications being slowed down on their IO operations, while the disks
>writes data continously during an interval that usually last a minute or
>so, but may last many times that. It often happens with small files
>(like, when sending a mail, as it passes through the MTA), so I believe
>it probably (re)writes to disk lots of stuff that doesn't need to be
>written to disk at all.
>It only happens on reiser4 patches against 2.6.13 or newer, 2.6.12.x is
>fine.
>  
>
So the pauses are experienced by a process waiting on fsync to finish?
If yes, then the problem is a very different issue from what I thought....

Hans
