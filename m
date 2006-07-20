From: Hans Reiser <reiser@namesys.com>
Subject: reiser4 status (correction)
Date: Thu, 20 Jul 2006 15:59:13 -0600
Message-ID: <44BFFCB1.4020009@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29093-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com, LKML <linux-kernel@vger.kernel.org>

Well, it seems we still aren't quite as stable as we were 6 months ago 
(the new reduced cpu usage code was extensive, as was the VFS change 
code), and we know of a bug we can reproduce using our standard tests.  
Also, it seems we can oops when a particular program is run to consume 
all memory (thanks Jate for finding it).  Hopefully things will be more 
stable next week....  Us developers are using the new code on our 
workstations without problem though.

On a more positive note, Reiser4.1 is getting closer to release....  It 
is working fine for the developer coding it, and we are scheduling code 
reviews for it and defining migration paths, etc.  Hopefully in 2 months 
it will ship.

The big issue with 4.1 is that we are having to deal with all the issues 
of REALLY allowing users to change default plugins, etc., and finding we 
missed details.  We will say more later.

Thanks for your patience,

Hans
