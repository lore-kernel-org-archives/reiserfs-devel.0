From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] reiserfs: fix handling of device names with /'s in them
Date: Mon, 17 Jul 2006 11:27:20 -0700
Message-ID: <44BBD688.6070502@namesys.com>
References: <6xQ4C-6NB-43@gated-at.bofh.it> <6xQea-6ZX-13@gated-at.bofh.it> <E1G1QFx-0001IO-K6@be1.lrz> <44B7D97B.20708@suse.com> <44B9E6D5.2040704@namesys.com> <44BA61A2.5090404@suse.com> <44BA8214.7040005@namesys.com> <44BABB14.6070906@suse.com> <44BAE619.9010307@namesys.com> <44BAECE2.8070301@suse.com>            <44BAFDC3.7020301@namesys.com> <200607171808.k6HI8kjL018161@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29042-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607171808.k6HI8kjL018161@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: Jeffrey Mahoney <jeffm@suse.com>, 7eggert@gmx.de, Eric Dumazet <dada1@cosmosbay.com>, ReiserFS List <reiserfs-list@namesys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@osdl.org>

Valdis.Kletnieks@vt.edu wrote:

>On Sun, 16 Jul 2006 20:02:27 PDT, Hans Reiser said:
>
>  
>
>>Create a mountpoint which knows how to resolve a/b without using a
>>"directory".
>>    
>>
>
>And said mountpoint gets past the '/' interpretation in the VFS, how, exactly?
>
>fs/namei.c, do_path_lookup() does magic on a '/' on about the 3rd line.
>So you're going to get handed 'a'.
>  
>
It does not need to be so complex actually,  Just create a plain old
parent directory just like every other parent directory in procfs.
