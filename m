From: David Nielsen <Lovechild@foolclan.com>
Subject: Re: New reiser4 snapshot (as of August 22, 2003)
Date: Fri, 22 Aug 2003 20:08:38 +0200
Message-ID: <1061575717.21328.4.camel@pilot.stavtrup-st.dk>
References: <20030822150853.GA960@namesys.com>
	 <1061574745.5714.1.camel@pilot.stavtrup-st.dk>
	 <16198.22925.274848.501590@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15390-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16198.22925.274848.501590@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: reiserfs-list@namesys.com

Not enough to just enable printing - and your code throws so many
warnings it's close to being scary (truely alpha... I love it)

I think the hack around would be to disable syscall support if I'm
correct?

fs/reiser4/sys_reiser4.c:54:32: parser/parser.code.c: No such file or
directory
fs/reiser4/sys_reiser4.c: In function `sys_reiser4':
fs/reiser4/sys_reiser4.c:75: warning: implicit declaration of function
`reiser4_pars_init'
fs/reiser4/sys_reiser4.c:75: warning: assignment makes pointer from
integer without a cast
fs/reiser4/sys_reiser4.c:80: error: dereferencing pointer to incomplete
type
fs/reiser4/sys_reiser4.c:82: warning: implicit declaration of function
`yyparse'fs/reiser4/sys_reiser4.c:83: warning: implicit declaration of
function `reiser4_pars_free'
fs/reiser4/sys_reiser4.c:66: warning: unused variable `Gencode'
fs/reiser4/sys_reiser4.c: At top level:
fs/reiser4/parser/parser.h:333: warning: `Fistmsg' defined but not used
fs/reiser4/parser/parser.h:342: warning: `typesOfCommand' defined but
not used
fs/reiser4/parser/parser.h:354: warning: `Code' defined but not used


On Fri, 2003-08-22 at 19:57, Nikita Danilov wrote:
> David Nielsen writes:
>  > This needs to be fixed - it doesn't compile 
> 
> Oops. As a work around, please, turn on REISER4_DEBUG_OUTPUT ("Printing"
> in reiser4 debug option sub menu).
> 
>  > 
>  > GCC version is 3.3.1
>  > 
> 
> Nikita.
> 
>  >   CC      fs/reiser4/txnmgr.o

