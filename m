From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: hans! i found a bug in reiser4 :((((
Date: Wed, 21 Apr 2004 16:34:04 +0400
Message-ID: <1082550843.27499.80.camel@tribesman.namesys.com>
References: <6.1.0.6.2.20040420151137.02ae2008@popfile>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18113-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <6.1.0.6.2.20040420151137.02ae2008@popfile>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeffrey Rice <jeffrice@finity.org>
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2004-04-20 at 23:14, Jeffrey Rice wrote:
> I would also like to confirm the bug with glibc and reiser4.  If I try to 
> compile with my /usr as Reiser4, I get an "#include nested too deeply" 
> error in syscalls.h.  If /usr is any other fs type, no problems.  It's hard 
> to believe the fs should be the cause but it really appears to be the case.
> 

I moved my suse9.0's /usr to reiser4 and performed the following:
cd /usr/src
mkdir compiling-glibc
cd compiling-glibc
tar jxf /tmp/glibc-2.3.2.tar.bz2
cd glibc-2.3.2
tar jxf /tmp/glibc-linuxthreads-2.3.2.tar.bz2
cd ..
./glibc-2.3.2/configure --enable-add-ons=linuxthreads --prefix=/usr
make

this did not hit "#include nested too deeply"

it ended up with 
sscanf.c:31: warning: conflicting types for built-in function `sscanf'
sscanf.c: In function `sscanf':
sscanf.c:37: error: `va_start' used in function with fixed args
make[2]: *** [/usr/ttt/stdio-common/sscanf.o] Error 1
make[2]: Leaving directory `/usr/ttt/glibc-2.3.2/stdio-common'
make[1]: *** [stdio-common/subdir_lib] Error 2
make[1]: Leaving directory `/usr/ttt/glibc-2.3.2'
make: *** [all] Error 2


It does so regardless to what filesystem holds /usr.
Would you please instruct me how to reproduce your problem?


> 
> *       *       *       *       *       *       *
> Jeffrey Rice    ||     jeffrice@finity.org      ||  www.finity.org
> 
> 
> 
> 
> 

