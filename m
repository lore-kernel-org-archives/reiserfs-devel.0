From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Reiser4 on top of software raid 0 (dmraid) - another problem
Date: Wed, 05 Jul 2006 12:49:03 +0400
Message-ID: <1152089343.6337.21.camel@tribesman.namesys.com>
References: <N1-H9MllQX4ad@Safe-mail.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28908-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <N1-H9MllQX4ad@Safe-mail.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Diego Pinheiro <diegopp@Safe-mail.net>
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2006-07-04 at 14:56 -0400, Diego Pinheiro wrote:
> I'm having another problem when running reiser4 on top of software raid 0 (dmraid)...
> 
> I can work the filesystem fine (mount, copy, create, delete, move, etc...) - 
> even big ammount of data (> 3Gb) as a separate (non / - root folder) filesystem. 
> But if I try to mount this filesystem as the root filesystem I get a segmentation fault in the init script 
> (in the process to update the /etc/mtab file (line 413 Fedora Core 5 init script). 
> The line "mount -f /" goes fine; but the line "mount -f /proc" generates the error)...
> 

We need to see the error. Would you, please, setup serial or net console
and catch the output?

> The same procedure with a ext3 filesystem goes fine, so apparently it's not the init script, 
> neither the software raid or the kernel (2.6.16.22 with 2.6.16-4 reiser4 patch)
> 
> Any ideas?
> 
> Thanks,
> Diego
> 

