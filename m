From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: fsck.reiser4 problem (was: reiser4 corruption problem)
Date: Tue, 31 Aug 2004 16:30:15 +0400
Message-ID: <1093955415.2716.476.camel@tribesman.namesys.com>
References: <20040831012446.631CB15E2E@mail03.powweb.com>
	 <200408311209.43653.IOBuf@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21153-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408311209.43653.IOBuf@gmx.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas <IOBuf@gmx.de>
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2004-08-31 at 14:09, Andreas wrote:
> Hello,
> 
> > Before doing so, however, try setting
> > the filesystem's default fibration plugin to none or whatever the 'no
> > fibration' option is. This will remove fibration code from the suspect list
> > if the retest is successful.
> 
> I can reproduce the reporting of filesystem corruptions with and 
> "without" fibration. But fsck.reiser4 crashes on --build-fs on my 
> machine. :-(
> 

Would you, please, provide exact sequences of operations which confuses
reiser4?

> System: 
> linux-2.6.8.1-mm4 
> libaal-1.0.0
> reiser4progs-1.0.0
> 
> Bye
>  Andreas
> 

