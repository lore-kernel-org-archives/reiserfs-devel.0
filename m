From: Anders Widman <andewid@tnonline.net>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Sat, 15 Feb 2003 14:04:54 +0100
Message-ID: <2164549156.20030215140454@tnonline.net>
References: <3E4AA902.86F15815@interface-ag.com>
 <20030214120630.O22930@schatzie.adilger.int> <3E4D4129.8040103@namesys.com>
 <200302151551.12765.vitaly@namesys.com>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12777-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302151551.12765.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


> Ok, so probably we should make the following changes. The kernel set IO_ERROR
> and FS_ERROR flags. 
> In the case of IO_ERROR reiserfsck prints the message about hardware problems
> and returns error, so the fs does not get mounted at boot. On attempt mounting
> the fs with IO_ERROR flag set it is mounted ro with some message about hardware
> problems. When you are sure that problems disappeared you can mount it with a
> spetial option cleaning this flag and probably reiserfstune will have some
> option cleaning these flags also.
> In the case of FS_ERROR - search_by_key failed or beyond end of device access
> or similar - reiserfsck gets -a option at boot, replays the journal if needed
> and checks for the flag. No flag - returns OK. Else - run fix-fixable. Errors
> left - returns 'errors left uncorrected' and the fs does not get mounted at
> boot. On attempt mounting the fs with the flag just print the message about
> mounting the fs with errors and mount it. Not ro here as kernel will not do
> deep analysis of errors and it could be just a small insignificant error.


  What  happens if there are FS errors on boot device? Not mounting ro
  will  make  system  inaccessible unless users has some other boot or
  rescue media.

  Of  course, this  is  where  admins  should  have  another  disk  or
  partition to boot and make FS repairs. :)

   - Anders

  


