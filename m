From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Check for ccreg40
Date: Tue, 13 May 2008 17:10:26 +0400
Message-ID: <48299342.8050409@gmail.com>
References: <loom.20080512T225740-889@post.gmane.org>	 <4828CFD5.7000408@gmail.com> <e85b9d30805130251j36bff6fcl899e817f07b9c7a4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <e85b9d30805130251j36bff6fcl899e817f07b9c7a4@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthew <jackdachef@gmail.com>
Cc: geearf@free.fr, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Matthew wrote:

>On Tue, May 13, 2008 at 1:16 AM, Edward Shishkin
><edward.shishkin@gmail.com> wrote:
>  
>
>  
>
[...]

>is there a way by showing the plugins in using grep (e.g. whether it's
>used lzo or gzip compression) ?
>  
>

grep for "lzo1" or "gzip1".
At least stat-data of root directory must contain it.

>for example grep 'ccreg shows' the following, that should mean ccreg40
>/ cryptcompression was used, correct ?
>
>  
>

yup

>debugfs.reiser4  -t -f /dev/sdd8 | grep ccreg
>debugfs.reiser4 1.0.6
>Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
>reiser4progs/COPYING.
>
>            create : id = 4 (ccreg40)
>            object : id = 4 (ccreg40)
>
