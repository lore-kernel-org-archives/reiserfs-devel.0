From: Rikard Johnels <rikjoh@norweb.se>
Subject: Failed ReiserFS
Date: Thu, 10 Feb 2005 05:35:01 +0100
Message-ID: <200502100535.01814.rikjoh@norweb.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello all.
I am new to the list so please have patience with me for maybe asking obvious 
questions.

I tried a recovery as described in the manpages;
 
talen:~ # reiserfsck --rebuild-tree -S /dev/hdc1 
--logfile /root/reisercheck.logfile

It ran as excpected (i hope) right up until the end where it barfed with; 

Pass 3a (looking for lost dir/files):
Looking for lost directories:
Looking for lost files:
lost+found.c 348 pass_3a_look_for_lost
look_for_lost: The entry 'lost+found' could not be found in the root 
directory.
Aborted

What is wrong?
What can i do?
-- 

         /Rikard

---------------------------------------------------------------
Rikard Johnels          email   : rikjoh@norweb.se
                        Web     : http://www.rikjoh.com/users/rikjoh
                        Mob     : +46 735 05 51 01
                        PGP     : 0x461CEE56
---------------------------------------------------------------
