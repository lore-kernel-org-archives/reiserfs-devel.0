From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: R4 won't mount.
Date: Wed, 21 Jan 2004 12:19:55 +0300
Message-ID: <16398.17467.601152.680867@laputa.namesys.com>
References: <400E42C6.4050305@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16599-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <400E42C6.4050305@shaw.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris wakefield <c_wakefield@shaw.ca>
Cc: reiserfs-list@namesys.com, paolunix@yahoo.com

Chris wakefield writes:
 > Hi Paolo.
 > Ok, I re-compiled a fresh 2.6.1 kernel, ran the command: 
 > wget http://www.namesys.com/snapshots/2004.01.19/all.diff.gz -q -O - 
 > |       zcat | patch -p1

Wait! You need http://www.namesys.com/snapshots/2004.01.19.fixed/all.diff.gz


 >  The R4 partitions mount fine, so all is fine now.
 > What I had done before, I remembered, was patch a 2.6.0 kernel with 
 > patch-2.6.1-bk4.bz2, which I suspect was the wrong patch.
 > Sorry for the unnecessary posts.
 > 
 > Ok, so now I can have some fun with R4!
 > 
 > Chris W.
 > 

Nikita.

 > 
