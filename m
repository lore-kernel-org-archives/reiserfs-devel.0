From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: production use of reiserfs
Date: Fri, 28 Nov 2003 12:48:42 +0300
Message-ID: <16327.6650.487369.786012@laputa.namesys.com>
References: <200311280846.12697.ivan@t1.unisoftbg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16175-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200311280846.12697.ivan@t1.unisoftbg.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ivan <ivan@t1.unisoftbg.com>
Cc: reiserfs-list@namesys.com

ivan writes:
 > Hi all,

Hello,

 > 
 > We are collecting our statistic for the last 9 m. of using linux + postgreSQL 
 > as oracle+windows alternative in production.
 > 
 > We are using linux redhat (7.3 and 9.0) + reiserfs (it was recomendet as 
 > stable and fast).
 > 
 > For this time we have 6 filesystem crashes (all after powerdown) with total 
 > database lose.
 > 
 > It is very bad situation because for this period we do not have any problems 
 > with windows + oracle.

Please provide more info: kernel messages, mount options, kernel version
(cat /proc/version), reiserfs-related portion of kernel .config, etc.

 > 
 > So it is now time to see if resierfs is production ready or we need to change 
 > the filesystem (or OS distro).
 > 
 > My question:
 > 
 > exist somewath special in reiserfs setup on redhat, that we need to change?
 > We are using the standart install (linux reiserfs).
 > 
 > We do not make changes on kernel or setup.
 > 
 > Is it good idea to change redhat?
 > 
 > Also it is possible to use redhat AS 3.0, but we do not find any info how to 
 > instsall it with reiserfs. Exist any problems on this distro?

It is much easier for us to track and deal with problems in the stock
kernel, but look at the http://www.namesys.com/support.html :)

 > 
 > regards,
 > ivan.

Nikita.
