From: Chris Worley <cworley@symbionsys.com>
Subject: Re: SUSE 9.1 with ReiserFS:  / won't fsck, but is otherwise fine
Date: Mon, 27 Sep 2004 16:40:02 -0600
Message-ID: <1096324801.9096.41.camel@xserver.local.net>
References: <1095996040.10293.18.camel@xserver.local.net>
	 <200409241116.09066.vitaly@namesys.com>
	 <1096032016.17001.4.camel@xserver.local.net>
	 <200409271844.11580.vitaly@namesys.com>
	 <1096301165.9096.14.camel@xserver.local.net>  <41589155.1050405@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21943-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41589155.1050405@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: evilninja <evilninja@gmx.net>
Cc: reiserfs-list@namesys.com

On Mon, 2004-09-27 at 16:16, evilninja wrote:
> ah, now this is funny. dd doesn't care about the filesystem and can't even
> read the device. 
> this does not seem like a (reiser-)fs issue, more like a
> corrupted partition table / device

I agree that it's not a reiser issue... but, how did it get mounted in
the first place?

>  (if the data on
> /dev/mapper/system-lvol0 is not (!) important, you could play around with

I find the root partition an invaluable part of the system.  So, I'm not
going to destroy it on purpose.  I'm not quite sure how to boot without
a root partition ;)

I'm really looking for a non-destructive way to test/repair whatever has
happened.  The partitioning seems fine (an ext3 boot directory of a few
MB, an 8GB swap, and the root partition):

   Device Boot      Start         End      Blocks   Id  System
/dev/hda1   *           1           5       40131   83  Linux
/dev/hda2               6         979     7823655   82  Linux swap
/dev/hda3             980       30515   237247920   8e  Linux LVM

Chris

