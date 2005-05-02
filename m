From: Boyd Waters <bwaters@nrao.edu>
Subject: Re: reiser4 on PPC
Date: Mon, 2 May 2005 10:11:14 -0600
Message-ID: <8BEC24C4-BBBD-4A52-9573-F565F60B21CF@nrao.edu>
References: <1114966993.11906.59.camel@gentoo> <20050502141026.GA6067@backtop.namesys.com> <1115049544.6385.20.camel@gentoo>
Mime-Version: 1.0 (Apple Message framework v728)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23959-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1115049544.6385.20.camel@gentoo>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: Alex Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com

I get this error as well on a newly-created reiser4 filesystem.

I'm using 2.6.12_rc3 with patches from 2.6.11-mm3 (which seemed to  
apply cleanly) on a Macintosh Mini.

What other debugging information is needed?

~ boyd
Boyd Waters
Socorro, New Mexico

> Well, now that I've actually checked it, there is a warning. I get the
> same message regardless of the architecture the FS is created on.
>
> reiser4[mount(22352)]: key_warning
> (fs/reiser4/plugin/object.c:96)[nikita-717]:
> WARNING: Error for inode 720575940379279360 (-2)
