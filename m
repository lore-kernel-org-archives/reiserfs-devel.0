From: "Roy Lanek" <lanek@novenine.com>
Subject: -- =?iso-8859-1?B?d2FybmluZygidnMtNDQiLCAib3V0?= of
  =?iso-8859-1?B?bWVtb3J5PyIpOw==?=
Date: Thu, 06 Apr 2006 06:41:32 +0000
Message-ID: <20060406064132.11477.qmail@mail.httpdnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28449-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

There might be something to debug around: 

   warning("vs-44", "out of memory?"); 

   line 2674 of /.../linux/fs/reiser4/plugin/file/file.c 

In fact, I just have seen a long, unterminated series of
reiser4-out-of-memory warnings in my logs when my box
has started to freeze ... till it has frozen completely
several minutes later. 

Unfortunately I have lost all the logs (see below) ... I
am sad for the #---- cut out --- thing that I have seen
and can't reproduce; I had to reboot and did not want to
write down by hand the few items that were visible trough
the few overlapped xterms (+ elvis). 

Don't worry, it will happen again enough soon: if you say
that it makes sense, I will manage to not be caught by
surprise again, will try to save the logs immediately,
when the system starts to freeze. 

OK, here a bit more context: 

** kernel (... uname): 

   2.6.16.1-grsec #3 Wed Apr 5 22:46:36 WIT 006 i586 pentium
   i386 GNU/Linux 

   compiled without debug support for reiser4 

   vanilla patches reiser4-for-2.6.16-1
   + grsecurity-2.1.9-2.6.16.1-200604041154 

** runit-1.4.1 + socklog-2.1.0 

** Slackware current, i.e., gcc 3.4.6 

** a P166/32 Mb + non SCSI HDs. (It works, I swear, and
well too!) 


Cheers, 

/Roy Lanek (West Sumatra) 

 --
########################       tak ada gading yang tak retak
##### . slackware ######   there are no ivory that is not cracked
##### +-----linux ######     [nothing is perfect in this world]
########################
