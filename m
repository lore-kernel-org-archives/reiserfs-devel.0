From: Chris wakefield <c_wakefield@shaw.ca>
Subject: Re: R4 won't mount.
Date: Wed, 21 Jan 2004 01:13:42 -0800
Message-ID: <400E42C6.4050305@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-16598-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: paolunix@yahoo.com

Hi Paolo.
Ok, I re-compiled a fresh 2.6.1 kernel, ran the command: 
wget http://www.namesys.com/snapshots/2004.01.19/all.diff.gz -q -O - 
|       zcat | patch -p1
 The R4 partitions mount fine, so all is fine now.
What I had done before, I remembered, was patch a 2.6.0 kernel with 
patch-2.6.1-bk4.bz2, which I suspect was the wrong patch.
Sorry for the unnecessary posts.

Ok, so now I can have some fun with R4!

Chris W.


