From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 13:47:16 +0300
Message-ID: <3E4A2634.8020609@namesys.com>
References: <NDBBJPAGKLCMDEIEKOPBAEIMKFAA.mailinglists@websitemanagers.com.au> <3452483515.20030212001747@tnonline.net> <3E499171.8080201@namesys.com> <5992434937.20030212112339@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12704-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5992434937.20030212112339@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Anders Widman wrote:

>
>  
>
>>If we handle the journal block error without downtime, the user will
>>never chuck the hard drive, and that is bad in the longterm.
>>    
>>
>
>  But  a  user  never  knows  he  has  a media error before his system
>  crashes  (or  do  a surface scan), or monitor his logs very closely.
>  Not all users does this.
>
>  To  me  a FS should be able to handle both read and write errors and
>  be  able to reallocate these errors to a sane are of the media. When
>  this  occurs then it should be noted in the kernel log (or similar).
>
>  Then  users can run a cron job to monitor the log after exactly this
>  error message.
>
>  The  whole  point  is  this that errors can occur at any time when a
>  system  is  up  and  running and it _always_ takes some time for the
>  user  to  react  and find out about the problem. In the time between
>  the  error  has  occurred  and  the  when the user finds out and can
>  administer it, then we need a solid and secure FS that can manage to
>  run  the  system and protect the data (which is why we choose one FS
>  over the other).
>
>  To  my  knowledge  only  Windows  with  NTFS  can handle just this -
>  relocating  bad  blocks  on  the fly and notifying the user such has
>  happened.
>
>  - Anders
>  
>
>
>
>
>
>  
>
Yes, you are probably right, we should do it for those cases where it is 
feasible. 

-- 
Hans


