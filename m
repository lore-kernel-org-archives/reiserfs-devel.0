From: Anders Widman <andewid@tnonline.net>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 16:26:13 +0100
Message-ID: <46110589437.20030212162613@tnonline.net>
References: <NDBBJPAGKLCMDEIEKOPBKEKHKFAA.mailinglists@websitemanagers.com.au>
 <11104354750.20030212144219@tnonline.net>
 <200302121515.46953.russell@coker.com.au>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12717-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302121515.46953.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> On Wed, 12 Feb 2003 14:42, Anders Widman wrote:
>> > A) Immediately re-mount the drive read-only, and wait for the sysadmin to
>> > either re-mount rw or to do some other data recovery/repair
>>
>> This  would be devastating for some form of servers and cause downtime
>> and  loss  of  work  for  plenty. Consider an application server, or a
>> document  server within a company. If writes were prohibited then lots
>> of programs do stop function, or saving fails.

> Servers should have RAID.  There is no excuse.  With RAID the regular disk
> errors should not be an issue.

Yes, most should use some form of hardware redundancy.

>> Unplanned downtime do cause lot of harm to any business.

> It's better to stop when there's a serious error than to blindly continue and
> make things worse.

I  (and  I  think  no  one  else)  never  said  continue blindly. Most
users/workstations do not have RAID and probably never will.

I can take any normal home-user as an example. They use single drives,
but  still  they  need to be able to rely on the filesystem to protect
their   data  and  not stop working if the drive has a few bad blocks.
Not  all users has spare drives, nor can find a replacement right away
so  they  have to be able to use their computers even though there are
bad blocks.

There  are  two  kinds of people I come across when it comes to Linux:

Those  that  say it is perfect and blame everything on the user or the
hardware.

The  others  want to make Linux a viable option for "normal" users and
want Linux to be able to replace Windows or Mac OS. The only way I see
that happen is if Linux starts to get more userfriendly and safe.

- Anders





