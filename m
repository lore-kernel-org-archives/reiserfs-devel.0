From: Russell Coker <bofh@coker.com.au>
Subject: Fwd: Re: [reiserfs-list] Reiserfs with Samba vs NetApp Filer
Date: Fri, 11 Oct 2002 20:28:52 +0200
Message-ID: <200210112028.52316.bofh@coker.com.au>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11655-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu, 10 Oct 2002 19:31, Hans Reiser wrote:
> I would say that WAFL is an absolutely superb filesystem for the purpose
> of RAID NFS fileserving.  Reiser4 may give it some serious competition
> after some time has passed and we have time for such things as carefully
> benchmarking NFS, etc., but WAFL is a great filesystem for NFS RAID as
> it is right now.  That said, mp3.com saved $22 million dollars by using
> Linux+reiserfs instead of Netapps and Veritas.  They may be good, but
> reiser3 is cheaper.  A lot cheaper.  Do the math, and you'll buy Linux
> instead I think.;-)
>
> Nobody has done reiser3 vs. WAFL benchmarks.

One thing that should be stated here is that you can use some of the money
 you save to buy more powerful hardware.  If ReiserFS is running on drives
 that have a higher rotational speed and there are more drives in the RAID
 then it should beat WAFL on most tests regardless of issues of file system
efficiency.

Also with a device such as a NetApp you have a limited choice of what
 hardware you can get.  You generally can't choose from all available sizes
 of drives, and I have been told that there is no supported option for
 upgrading a NetApp device to bigger drives (while doing so on Linux software
 RAID is easy and I've done it many times with both ReiserFS and Ext2/3).

One of my machines started out with a RAID-1 of 6G drives and now has a
 RAID-1 of 80G drives.  If I was to do it the NetApp way it would now have at
 least 4 drives in the machine, maybe 6!

Of course some of the things I do with Linux software RAID are not what might
be considered "supported options".  But I've investigated things properly,
read source where necessary, and talked to the author, so I'm confident in my
ability to do this on live production servers without risk.  No way will I do
anything remotely unsupported on a NetApp, I don't know what the result might
be!

Finally, for a Linux server, being cheaper it's easy to install a test
 server. Sometimes for a Linux server upgrade I setup a test machine to mimic
 the server and upgrade it to make sure that the upgrade proceedure works,
 afterwards the test server goes back to being a desktop workstation.  What
 would I do with a test NetApp for the other 51 weeks in the year?

Finally, what do you do when you want to check that the permissions on
100,000,000 files are correct?  You don't want to do that over NFS...

--
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

