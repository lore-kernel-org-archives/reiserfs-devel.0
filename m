From: Andreas <IOBuf@gmx.de>
Subject: Re: fsck.reiser4 problem (was: reiser4 corruption problem)
Date: Tue, 31 Aug 2004 12:09:43 +0200
Message-ID: <200408311209.43653.IOBuf@gmx.de>
References: <20040831012446.631CB15E2E@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21152-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040831012446.631CB15E2E@mail03.powweb.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

> Before doing so, however, try setting
> the filesystem's default fibration plugin to none or whatever the 'no
> fibration' option is. This will remove fibration code from the suspect list
> if the retest is successful.

I can reproduce the reporting of filesystem corruptions with and 
"without" fibration. But fsck.reiser4 crashes on --build-fs on my 
machine. :-(

System: 
linux-2.6.8.1-mm4 
libaal-1.0.0
reiser4progs-1.0.0

Bye
 Andreas
