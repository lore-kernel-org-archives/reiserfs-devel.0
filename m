From: Oleg Drokin <green@namesys.com>
Subject: Re: data loss with reiserfs
Date: Fri, 21 Jun 2002 21:25:43 +0400
Message-ID: <20020621212543.A1160@namesys.com>
References: <200206211920.38534.JPicht85@web.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10784-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200206211920.38534.JPicht85@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julian Picht <JPicht85@web.de>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Jun 21, 2002 at 07:21:37PM +0200, Julian Picht wrote:

> So i wanted to do "reiserfsck" but when I mounted the drive read/write it said
> ----------------------
> reiserfsck 3.x.1b (2002)
> Will read-only check consistency of the filesystem on /dev/hdb3
> Will put log info to 'stdout'
> 
> Do you want to run this program?[N/Yes] (note need to type Yes):Yes
> ###########
> reiserfsck --check started at Fri Jun 21 19:13:18 2002
> ###########
> Device /dev/hdb3 is mounted w/ write permissions, can not check it
> ----------------------
> When I mounted it read only it said the same, also when I did not mount the 
> device at all: the same message.

you mean
umount /dev/hdb3 ; reiserfsck --check /dev/hdb3
produces error about device being already mounted?
Anything interesting in logs?
I hope /dev/hdb3 is not your root device?

Bye,
    Oleg
