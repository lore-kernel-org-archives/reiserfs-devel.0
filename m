From: Anders Widman <andewid@tnonline.net>
Subject: Re: Promise raid controller writes to disk, anybody know where?
Date: Wed, 16 Apr 2003 18:28:35 +0200
Message-ID: <1957222044.20030416182835@tnonline.net>
References: <3E9D83B7.4050904@namesys.com>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13678-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E9D83B7.4050904@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Reiserfs-List@namesys.com

> I just bought this motherboard with a promise raid controller builtin 
> whose manual mentions that it writes information to disk (volume and 
> config info I believe).  Anybody know where it does this, and whether I 
> need to be worried about it stepping on something?


   It  should be inside the partition table or the mbr. Should be easy to
   verify  this  though  by  zeroing out the disk, connect to the promise
   controller  and  the  run  a  check  on  the disk and see where it has
   changed?

   //Anders



--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

