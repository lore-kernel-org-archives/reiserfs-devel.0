From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: dbench regression in 2.6
Date: Tue, 9 Sep 2003 14:35:33 +0400
Message-ID: <16221.44277.929879.883159@laputa.namesys.com>
References: <3F5636F5.4060000@austin.ibm.com>
	<200309041138.40795.vs@namesys.com>
	<3F574AEE.7080402@austin.ibm.com>
	<200309082105.37309.vs@namesys.com>
	<3F5CDECC.8060404@austin.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15604-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F5CDECC.8060404@austin.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steven Pratt <slpratt@austin.ibm.com>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com, reiserfs-dev@namesys.com

Steven Pratt writes:
 > Ok, first let me start with appologies as this turns out to be a wild 
 > goose chase.  It seems that I am running the version of reiserfsprogs 
 > that ships with SLES 8.0 (3.6.2) which has a hardcoded check for kernel 
 > versions 2.2, 2.4 and 2.5, but does not know about 2.6 and thus the 
 > mkfs.resiserfs is failing.  Since all of this testing is automated this 
 > failure was not caught, and the dbench numbers reported were actually 
 > for the last filesystem run on that drive, in this case XFS (which is 
 > why it looks so bad :-) ).  I have fixed the scripts to force the format 

It is a pity you found this so fast. I guess in a day or two Vladimir
would have determined and fixed the reason of this "regression" and sped
up reiserfs. :)

 > to 3.6 and all seems to be well.  If I get the chance I will go backfill 
 > all of the numbers.  Sorry for the confusion but I run these regresion 
 > tests in my spare time and don't always have time to crawl through the 
 > output, although a simple look in the captured /proc/mounts, or even the 
 > fstype file I create in the benchmark directory would have saved us all 
 > a lot of time. 
 > 
 > Again, sorry for the confusion, keep up the good work.
 > 
 > Steve
 > 

Nikita.
