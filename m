From: Anders Widman <andewid@tnonline.net>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 11:23:39 +0100
Message-ID: <5992434937.20030212112339@tnonline.net>
References: <NDBBJPAGKLCMDEIEKOPBAEIMKFAA.mailinglists@websitemanagers.com.au>
 <3452483515.20030212001747@tnonline.net> <3E499171.8080201@namesys.com>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12703-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E499171.8080201@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

>>
>>However,  the FS SHOULD support handling of bad blocks/clusters at the
>>FS  layer,  even  while running in a production system. Bad blocks can
>>pop  up  at any give time for no particular reason, and it is at these
>>times  you  (we) need a strong and reliable filesystem that can handle
>>and logically remap broken blocks/sectors.
>>
>>Sure,  a  disk  with physical errors should be replaced, but until you
>>find out about the error on the drive the FS HAS TO HANDLE these kinds
>>of problems.
>>
>> - Anders
>>
> We have gotten better at this over time.  There was a point in time when
> some of our guys reviewed all the bad block handling.  We still find
> cases where we could be better though.

  I  never  intended to blame ReiserFS, just mate the point in general
  for any FS :)

> For some users it would be better to boot to a corrupted filesystem 
> because running fsck is more of a problem than putting their data at
> higher risk.  For datalogging, it is probably conceivable to just toss
> the journal and lose the more recent updates to it.  For the default
> metadata journaling, this just does not seem prudent.

> I really prefer making users understand that they have a problem they
> need to do something about.  This is just my style.  I want them to fail
> to boot, and after some effort learn that there is this thing called
> fsck, and dd_rescue, and that it is time to buy another hard drive and
> chuck their current one.  It would be best though if they were given
> detailed instructions about how they need to do this when the code hits
> that bad block.  Vitaly, please work on that.

> If we handle the journal block error without downtime, the user will
> never chuck the hard drive, and that is bad in the longterm.

  But  a  user  never  knows  he  has  a media error before his system
  crashes  (or  do  a surface scan), or monitor his logs very closely.
  Not all users does this.

  To  me  a FS should be able to handle both read and write errors and
  be  able to reallocate these errors to a sane are of the media. When
  this  occurs then it should be noted in the kernel log (or similar).

  Then  users can run a cron job to monitor the log after exactly this
  error message.

  The  whole  point  is  this that errors can occur at any time when a
  system  is  up  and  running and it _always_ takes some time for the
  user  to  react  and find out about the problem. In the time between
  the  error  has  occurred  and  the  when the user finds out and can
  administer it, then we need a solid and secure FS that can manage to
  run  the  system and protect the data (which is why we choose one FS
  over the other).

  To  my  knowledge  only  Windows  with  NTFS  can handle just this -
  relocating  bad  blocks  on  the fly and notifying the user such has
  happened.

  - Anders
  



