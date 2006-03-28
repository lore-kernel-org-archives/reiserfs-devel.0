From: Hans Reiser <reiser@namesys.com>
Subject: Re: 2.6.16-rc6-mm2: slow writes on reiser4.
Date: Tue, 28 Mar 2006 12:34:48 -0800
Message-ID: <44299DE8.8080103@namesys.com>
References: <44206D3C.7050504@free.fr> <4420FFA2.1090908@namesys.com> <44219CC2.3060405@free.fr> <44219FA8.2050606@namesys.com> <44299A35.50800@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28386-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44299A35.50800@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: reiserfs-list@namesys.com, vs <vs@thebsh.namesys.com>, Alexander Zarochentcev <zam@namesys.com>, "E. Gryaznova" <grev@namesys.com>

Laurent Riffard wrote:

>
>
>See ? 3'30" versus 16".
>
>I packed the metadata of my original FS to a file, you can grab it
>from http://laurent.riffard.free.fr/kernel.reiser4.bz2 (6.7M).
>  
>
Wow.  We need to do the repacker.  We might also need to examine whether
there are optimizations in V3 block allocation we should apply to V4,
but mostly we need the repacker.  Ok, well, right after we go into the
kernel it will be done.

Thanks much Laurent, you did a great job of analyzing this for us.

>Note I was unable to unpack it :
>  
>
>># bunzip2 -c /tmp/kernel.reiser4.bz2 | debugfs.reiser4 -U /dev/vglinux1/test 
>>debugfs.reiser4 1.0.5
>>Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by reiser4progs/COPYING. 
>>
>>Info : The metadata were packed with the reiser4progs 1.0.5.                                                                                                        
>>Error: Can't unpack filesystem.                     
>>    
>>
>
>~~
>laurent
>
>
>  
>

