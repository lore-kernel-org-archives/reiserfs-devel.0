From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: After `quotacheck` ReiserFS Root Filesystem Won't Mount Read-Write
Date: Fri, 20 Aug 2004 09:17:06 +0300
Message-ID: <200408200917.06685.rmeijer@internet.gr>
References: <22c16c22abfc.22abfc22c16c@optonline.net> <200408170303.41737.bernd-schubert@web.de> <412553A0.4050301@poelzi.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20416-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412553A0.4050301@poelzi.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Fri 20 August 2004 04:28, daniel.poelzleithner wrote:

> | "init=/bin/bash rw"
> |
> | Then after booting:
> | vi /etc/fstab
> | sync; sync;  sync

> mount / -o remount,ro
>
> Then you can savely press the reboot button.

Or use the Magic Sys Rq key:

e -> TeRM signal to all processes
i -> KiLL signal to all processes
s -> Sync
u -> Umount filesystems
b -> reBoot

Works for me :)


Ray
