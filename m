From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: dead inode read from disk... ignore?
Date: Tue, 18 Nov 2003 19:44:29 +0300
Message-ID: <16314.19565.501517.142186@laputa.namesys.com>
References: <3FB20ACD.8080105@dotcom.pl>
	<16313.57788.693126.214555@laputa.namesys.com>
	<3FB9A2DE.1010108@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16122-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FB9A2DE.1010108@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: myciel <myciel@dotcom.pl>, reiserfs-list@namesys.com

Hans Reiser writes:
 > Nikita Danilov wrote:
 > 
 > >myciel writes:
 > > > Hi
 > > > 
 > > > Few times a day I get in syslog:
 > > > kernel: sd(8,20):vs-13075: reiserfs_read_inode2: dead inode read from 
 > > > disk [11574064 47212 0x0 SD]. This is likely to be race with knfsd. Ignore
 > > > 
 > > > I just wanted to be sure: should I  really ignore this?
 > >
 > >Sorry, for delay.
 > >
 > >Yes, you should ignore it as it says.
 > >
 > > > 
 > > > kernel: 2.4.22 SMP + data-logging patches + Trond's nfs patches
 > > > 2 filesystems:  ~800G and  ~450G,
 > > > filled in ~50% with small files avg size ~36kb
 > > > 
 > > > thanks
 > > > 
 > > > rafal
 > > > 
 > >
 > >Nikita.
 > >
 > >
 > >  
 > >
 > then move this code into REISERFS_DEBUG.....

It does indicate an error, when NFS is not used.

 > 
 > -- 
 > Hans
 > 

Nikita.

 > 
