From: Anders Widman <andewid@tnonline.net>
Subject: Re: reiserfsprogs 3.6.5-pre2 release.
Date: Wed, 26 Feb 2003 13:14:25 +0100
Message-ID: <1794518093.20030226131425@tnonline.net>
References: <200302251650.22469.vitaly@namesys.com>
 <200302251712.45985.vitaly@namesys.com>
 <20030226015448.1efac468.philippe.gramoulle@mmania.com>
 <20030226102934.A2659@namesys.com> <3E5CA48C.5070807@namesys.com>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12931-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E5CA48C.5070807@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


>>># time reiserfsck -a /dev/sdb1
>>>Reiserfs super block in block 16 on 0x811 of format 3.6 with standard journal
>>>Blocks (total/free): 143109020/59148009 by 4096 bytes
>>>Filesystem is cleanly umounted
>>>Replaying journal..
>>>0 transactions replayed
>>>Checking internal tree..finished                  
>>>real    0m47.890s
>>>user    0m6.668s
>>>sys     0m0.732s
>>>    
>>>
>>
>>Thanks for trying.
>>48 seconds is much longer than we expected such test should take.
>>Was the system loaded at the time of test?
>>
> Yes, 48 seconds is too long to be acceptable.

Would it be possible to lower the time it takes to mount a filesystem?
Currently it takes about 48s to mount my fs:

  time mount /dev/Server/FTPRoot /glftpd/site -o noatime

  real    0m48.906s
  user    0m0.000s
  sys     0m0.090s

  Filesystem            Size  Used Avail Use% Mounted on
  /dev/Server/FTPRoot   744G  723G   21G  98% /glftpd/site


~ Anders




