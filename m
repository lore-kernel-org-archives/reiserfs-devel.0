From: Hans Reiser <reiser@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Mon, 19 Sep 2005 15:01:08 -0700
Message-ID: <432F3524.101@namesys.com>
References: <432AFB44.9060707@namesys.com>	<200509171416.21047.vda@ilport.com.ua>	<17197.15183.235861.655720@gargle.gargle.HOWL>	<feed8cdd05091912362ac13f3e@mail.gmail.com> <17199.10558.939696.765980@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26099-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17199.10558.939696.765980@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <nikita@clusterfs.com>
Cc: stephen.pollei@gmail.com, Alexander Zarochentcev <zam@namesys.com>, Denis Vlasenko <vda@ilport.com.ua>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Nikita Danilov wrote:

>
>It's enough to monitor your own code, rather than the whole kernel.
>  
>
To this I would add, the kernel should not have warnings when it
compiles.  Now THAT is a style requirement I would rigorously enforce if
I could.  I deeply regret that long ago there was a Linux scsi driver
author who left a warning in, and then after that they started
multiplying throughout the kernel.  It makes users much more confident
when they patch the kernel if there are no warnings that leave them
wondering if the new patch created the warning or if it was there before.

Hans
