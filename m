From: "Bostjan Skufca (at) domenca.si" <bostjan.skufca@domenca.si>
Subject: Re: another quota problem
Date: Tue, 13 Jan 2004 12:18:10 +0100
Message-ID: <200401131218.10626.bostjan.skufca@domenca.si>
References: <Pine.LNX.4.44.0401122320180.9334-100000@august.V-LO.krakow.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16472-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0401122320180.9334-100000@august.V-LO.krakow.pl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jakub Neumann <yavi@V-LO.krakow.pl>
Cc: reiserfs-list@namesys.com

Beside your problem your /etc/fstab entry should look like this (mark last 
zero):
/dev/sda7	/home	reiserfs	nosuid,nodev,usrquota  0  0

Can you paste in here your kernel options under "File systems" from .config?


On Monday 12 of January 2004 23:29, Jakub Neumann wrote:
> I compiled the 2.4.23 kernel with reiserFS, quota patches for
> it form <somewhere on the suse mirror> and grsecurity.
> But when I booted it, I got a "unknown option usrquota" error on
> my /home (which is the only fs with quota enabled)...
> Used 2.4.20 with ReiserFS quota before, and there was no such
> problem.
> my line from /etc/fstab:
> /dev/sda7	/home	reiserfs	nosuid,nodev,usrquota  0  2
>
> I'd be happy if anybody could help me :)

-- 
Z lepimi pozdravi,

Bostjan Skufca
sistemski administrator

Domenca d.o.o. 
Tel: +386 4 5835444
Fax: +386 4 5831999
http://www.domenca.si

