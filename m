From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: 2.4.21-rc3
Date: Fri, 23 May 2003 19:43:26 +0200
Message-ID: <m3adddftj5.fsf@merlin.emma.line.org>
References: <200305232256.17604.russell@coker.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14234-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200305232256.17604.russell@coker.com.au> (Russell Coker's
 message of "Fri, 23 May 2003 22:56:17 +1000")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Russell Coker <russell@coker.com.au> writes:

> I've noticed that the modules ide-taskfile.o and ide-io.o depend on each other 
> if you compile the 2.4.21-rc3 with IDE as modules.
>
> Is this a bug in the kernel or are we supposed to use a new module loader that 
> can resolve such things?

Kernel bug. IDE doesn't work as a module currently. IMHO, the
corresponding configuration option should be made "yes/no" rather than
"yes/module/no" for the time being. I posted such a suggestion to
linux-kernel earlier today ("yesterday" for Australians at home :-)

-- 
Matthias Andree
