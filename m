From: Hans Reiser <reiser@namesys.com>
Subject: Re: data corruption with 2.4.25 and datalogging patches
Date: Wed, 12 Jul 2006 01:24:11 -0700
Message-ID: <44B4B1AB.5060001@namesys.com>
References: <200607120816.11292.fjcabello@visual-tools.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28972-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607120816.11292.fjcabello@visual-tools.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Francisco Javier Cabello <fjcabello@visual-tools.com>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

Francisco Javier Cabello wrote:

>Hello,
>My company develops video recorder system. Basically we work with linux boxes 
>running kernel 2.4.25. The system captures analogue video,  and after 
>processing and compressing, digital video is stored to hard disk. We are 
>recording continuously (24x7). 
>
>We have realized that more or less a 10% of our systems are suffering data 
>corruption in the reiserfs partition. Sometimes it's possible to fix it 
>running 'reiserfsck --rebuild-tree' but not always.
>More information:
>-Kernel 2.4.25 + v4l2 patches
>-Reiserfsprogs 3.6.19
>-Datalogging patches. 
>(http://mirror.mcs.anl.gov/suse-people/mason/patches/data-logging/2.4.25/)
>
>I have checked datalogging patches from Reiserfs website and they seem equal 
>to suse ones.
>
>I don't have any idea of what it's happening. The disk bandwidth is not so 
>high (300-500kb/sec). The disk is always full at 90% (we have a process 
>deleting old video).
>
>I have been thinking about removing Dataloggin patches but I would like to 
>have serious reason. It's not easy to check that the problem is solved 
>because we are not able to reproduce the error in our headquarter. 
>
>Regards,
>
>Paco
>
>
>  
>
Unless Chris has an idea what might be going on off the top of his head,
this sounds like a paid support problem, and I must say it sounds like
it could be a lot of work to reproduce it.  If solving it still
interests you, we charge $150/hr.

I have made no efforts to test and verify the datalogging patches
myself, and most users do meta-data journaling, so I cannot say much
without assigning to someone the task of reviewing them and your problem.

Reiser4 might be a desirable answer for you.
