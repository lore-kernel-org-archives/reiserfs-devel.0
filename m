From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: dead inode read from disk... ignore?
Date: Tue, 18 Nov 2003 12:09:16 +0300
Message-ID: <16313.57788.693126.214555@laputa.namesys.com>
References: <3FB20ACD.8080105@dotcom.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16110-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FB20ACD.8080105@dotcom.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: myciel <myciel@dotcom.pl>
Cc: reiserfs-list@namesys.com

myciel writes:
 > Hi
 > 
 > Few times a day I get in syslog:
 > kernel: sd(8,20):vs-13075: reiserfs_read_inode2: dead inode read from 
 > disk [11574064 47212 0x0 SD]. This is likely to be race with knfsd. Ignore
 > 
 > I just wanted to be sure: should I  really ignore this?

Sorry, for delay.

Yes, you should ignore it as it says.

 > 
 > kernel: 2.4.22 SMP + data-logging patches + Trond's nfs patches
 > 2 filesystems:  ~800G and  ~450G,
 > filled in ~50% with small files avg size ~36kb
 > 
 > thanks
 > 
 > rafal
 > 

Nikita.
