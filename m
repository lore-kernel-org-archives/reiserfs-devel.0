From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck 3.6.11 locks up
Date: Mon, 22 Dec 2003 15:31:25 +0300
Message-ID: <200312221531.25536.vitaly@namesys.com>
References: <84c101c3c885$41f70860$74cb010a@mail2world.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16376-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <84c101c3c885$41f70860$74cb010a@mail2world.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Fendrich <david@fendrich.net>, reiserfs-list@namesys.com

On Monday 22 December 2003 15:15, David Fendrich wrote:
> The problem is solved. I used the 3.6.12pre version and everything went
> smooth.
>
>
> So reiserfsck continues to do smth but no progress anymore, right?
> Have you built the progs on the same computer where you run it?
> Would you check your memory with memtest or similar?
>
>
> I don't think that reiserfsck continued to do anything. The whole
> computer froze, ssh went down, I couldn't even switch virtual terminals
> (I run Gentoo linux 2.4.22-ac, so yes the progs are built on the same
> computer with the only optimization being -03), but alt-sysrq worked.
> This happened twice at exactly the same place in pass 1, so anyone else
> having the same problem should try 3.6.12.

a user process should not freeze the system, so it is hard to believe that 
this was a problem in progs, more likely a problem in the hardware or in 
the kernel. Did you use the same kernel as with 3.6.12-pre1? 

-- 
Thanks,
Vitaly Fertman
