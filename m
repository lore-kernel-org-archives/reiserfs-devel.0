From: "Michael Harnois" <mharnois@cpinternet.com>
Subject: rebuild-tree fails in pass 2
Date: Thu, 15 Jan 2004 06:39:09 -0600
Sender: mharnois@cpinternet.com
Message-ID: <400689ed.42cd.0@cpinternet.com>
Reply-To: mharnois@cpinternet.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16519-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I am running a 2.6.1 kernel pulled from bk yesterday and using 
reiserfsprogs-3.6.11. Something happened after I rebooted that 
caused filesystem corruption which instructed me to run 
rebuild-tree. But it will not run to completion. During pass 2 
it fails with 
	Assertion `*first < bm->bm_bit_size' failed 
 
Any ideas? 
 
