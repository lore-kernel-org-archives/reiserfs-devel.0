From: Huub <huubvanniekerk@gmail.com>
Subject: Re: partition cannot be mounted from grub
Date: Thu, 21 Sep 2006 18:39:43 +0200
Message-ID: <eeuf8g$anr$1@sea.gmane.org>
References: <eet9jg$463$1@sea.gmane.org> <200609211559.12052.vs@namesys.com> <eetvnu$c38$1@sea.gmane.org> <200609211643.06775.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29966-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609211643.06775.vs@namesys.com>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

> I would guess that you got partition table corruption. 
> You may want to try to fdisk /dev/hdc in the way it was partitioned before. 
> However, boundaries of partitions are to known presizely for that, though.
> 
> You may also try gpart(8). It does not look at partition table and may find partition boundaries.
> 

Reinstalled Suse 10.1 from scratch. Went very smooth. Running 
again...just curious for how long.
Another question however: is ReiserFS capable of handling sudden 
reboots? I suspect my systemboard needs to be replaced since it reboot 
or freezes now and then, but so far I never had an fs being ruined 
beyond repair.

