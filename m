From: Alex Brandt <alunduil@alunduil.com>
Subject: Re: Reiser4 compile error on vanilla-sources-2.6.27
Date: Fri, 10 Oct 2008 20:07:40 -0500
Message-ID: <48EFFC5C.30504@alunduil.com>
References: <19928070.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <19928070.post@talk.nabble.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: reiserfs-devel@vger.kernel.org

callx wrote:
> I patched vanilla and got no errors. On doing a make this happened:
>
> scripts/kconfig/conf -s arch/x86/Kconfig
>     CHK       include/linux/version.h
>     CHK       include/linux/utsrelease.h
>     CALL      scripts/checksyscalls.sh
>     CHK       include/linux/compile
> dnsdomainname: Hostname lookup failure
>     CC [M]   fs/reiser4/jnode.o
> fs/reiser4/jnode.c: In function 'jnode_lock_page':
> fs/reiser4/jnode.c:750: error: implicit declaration of function
> 'TestSetPageLoocked'
> make[2]: *** [fs/reiser4/jnode.o] Error 1
> make[1]: *** [fs/reiser4] Error 2
> make: *** [fs] Error 2
>
> I used this patch:
> http://zen-sources.org/files/reiser4-for-2.6.27-rc1.patch
>   
Looks like a typo in that function call. Change the code your building
(fs/reiser4/jnode.c line 750) to TestSetPageLocked (one o not two), and
see if it compiles then.

Regards,

Alex Brandt

-- 
Student, B.S. Physics & Computer Science
Department of Physics and Astronomy, MSUM
Department of Computer Science and Information Systems, MSUM
www.alunduil.com

