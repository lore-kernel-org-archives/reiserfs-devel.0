From: Bingner Sam J Contractor PACAF CSS/SCHE <Sam.Bingner@hickam.af.mil>
Subject: RE: Reiserfs oops
Date: Thu, 10 Apr 2003 18:32:05 -0000
Message-ID: <A6B0BFA3B496A24488661CC25B9A0EFA0325C65E@himl07.hickam.pacaf.ds.af.mil>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13636-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Anders Widman' <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

RAID0 = appending or striping, no redundancy
RAID1 = mirroring

http://www.cs.wustl.edu/cs/cs/archive/CS401_SP01/mar23/slide3.html

> -----Original Message-----
> From: Anders Widman [mailto:andewid@tnonline.net]
> Sent: Thursday, April 10, 2003 8:27 AM
> To: reiserfs-list@namesys.com
> Subject: Re: Reiserfs oops
> 
> 
> >>         Oleg, I'm seeing the attached oops's when a hard 
> drive failure is
> >> encountered. There are four drives in RAID 1. Is it normal 
> for reiserfs to
> >> oops when a drive fails?
> 
> You mean raid5/raid0 ?
> 
> Is  not RAID1 = striping without redundancy? Or am I the one who is to
> tried right now? ;)
> 
