From: Russell Coker <russell@coker.com.au>
Subject: Re: How to build a big file server
Date: Sat, 7 Jun 2003 01:15:51 +1000
Message-ID: <200306070115.51648.russell@coker.com.au>
References: <1054800852.1997.15.camel@wusel.schnulli.de> <200306060143.13516.sam@vilain.net> <3EE077E5.2030003@inway.cz>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14479-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EE077E5.2030003@inway.cz>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vitezslav T. Se'm" <travis@inway.cz>
Cc: reiserfs-list@namesys.com

On Fri, 6 Jun 2003 21:15, Vitezslav T. Se'm wrote:
> This is not about performace mostly, but about reliability. When U have
> 2 disks on one ribon, there is a serious problem, when one of them
> crash, because in 99% cases, the other disk stops responding to. This is
> IDE, not SCSI,

The same problem occurs on SCSI.

If you buy a serious storage system from Sun such as an A5000 which is 
correctly configured then you will expect to have multiple RAID-5's, where 
for each RAID-5 you have no more than one disk on any given SCSI channel 
(cable), and the hot-spare disks are on a separate channel too.

In any situation where you have a bus with multiple devices connected to it 
then a single device can kill the entire bus if it breaks in the wrong way.  
I've seen this happen in Ethernet hubs, SCSI, IDE, PCI, and ISA.

As to which buses are most prone to such errors, all evidence that I am aware 
of is anecdotal.  For PCI you usually don't have much choice, machines with 
hot-swap PCI and multiple independant PCI buses are very rare, ISA is history 
so it's not something we have to worry about.  For SCSI and IDE you want to 
be able to lose a cable without losing the system if you want reliability.  
You just don't want Ethernet hubs.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

