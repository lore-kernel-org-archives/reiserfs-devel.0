From: Gunnar Ritter <Gunnar.Ritter@pluto.uni-freiburg.de>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 07 Sep 2004 18:55:26 +0200
Message-ID: <413DE7FE.nailD9I11PGNI@pluto.uni-freiburg.de>
References: <200409070206.i8726vrG006493@localhost.localdomain>
 <413D4C18.6090501@slaphack.com> <m3d60yjnt7.fsf@zoo.weinigel.se>
 <1183150024.20040907143346@tnonline.net>
 <413DD5B4.nailC801GI4E2@pluto.uni-freiburg.de>
 <1401724342.20040907182551@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21577-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1401724342.20040907182551@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Spam <spam@tnonline.net>
Cc: ReiserFS List <reiserfs-list@namesys.com>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org

Spam <spam@tnonline.net> wrote:

> > Spam <spam@tnonline.net> wrote:
> >>   One suggestion is missed. It is to provide system calls for copy.
> >>   That would also solve the problem.
> > No, it would not. If you read the POSIX.1 specification for cp
> > carefully <http://www.unix.org/version3/online.html>, you will
> > notice that the process for copying a regular file is carefully
> > standardized. A POSIX.1-conforming cp implementation would not
> > be allowed to copy additional streams, unless either additional
> > options are given or the type of the file being copied is other
> > than S_IFREG. And cp is just one example of a standardized file
> > handling program.
>   It would solve the problem in Linux. However, it may not be POSIX.1
>   compatible. On the other hand I read that NTFS 5.0 is POSIX.1
>   compliant - and Windows uses copy system call.

You should obviously take a thorough read of at least the Base
Definitions, section 2, 'Conformance' of POSIX.1 before you further
comment on this issue.

	Gunnar
