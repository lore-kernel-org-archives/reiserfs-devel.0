From: Francisco Javier Cabello <fjcabello@visual-tools.com>
Subject: data corruption with 2.4.25 and datalogging patches
Date: Wed, 12 Jul 2006 08:16:10 +0200
Message-ID: <200607120816.11292.fjcabello@visual-tools.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28970-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,
My company develops video recorder system. Basically we work with linux boxes 
running kernel 2.4.25. The system captures analogue video,  and after 
processing and compressing, digital video is stored to hard disk. We are 
recording continuously (24x7). 

We have realized that more or less a 10% of our systems are suffering data 
corruption in the reiserfs partition. Sometimes it's possible to fix it 
running 'reiserfsck --rebuild-tree' but not always.
More information:
-Kernel 2.4.25 + v4l2 patches
-Reiserfsprogs 3.6.19
-Datalogging patches. 
(http://mirror.mcs.anl.gov/suse-people/mason/patches/data-logging/2.4.25/)

I have checked datalogging patches from Reiserfs website and they seem equal 
to suse ones.

I don't have any idea of what it's happening. The disk bandwidth is not so 
high (300-500kb/sec). The disk is always full at 90% (we have a process 
deleting old video).

I have been thinking about removing Dataloggin patches but I would like to 
have serious reason. It's not easy to check that the problem is solved 
because we are not able to reproduce the error in our headquarter. 

Regards,

Paco


-- 
One of my most productive days was throwing away 1000 lines of code (Ken 
Thompson)
