From: Yury Umanets <umka@namesys.com>
Subject: Re: build problem BK reiser4progs: /usr/include/features.h:218:52:
 operator '==' has no left operand
Date: Thu, 16 Jan 2003 15:40:01 +0300
Message-ID: <3E26A821.4060006@namesys.com>
References: <20030116102742.I7526@humilis> <3E268CFD.5080604@namesys.com> <20030116120230.J7526@humilis> <3E2692AE.2030704@namesys.com> <20030116121007.L7526@humilis> <3E269499.2090909@namesys.com> <20030116123949.N7526@humilis> <3E26A2A6.702@namesys.com> <20030116133100.O7526@humilis>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12386-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030116133100.O7526@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ookhoi@humilis.net
Cc: Reiserfs-List <reiserfs-list@namesys.com>

Ookhoi wrote:

>Yury Umanets wrote (ao):
>  
>
>>>>Strange :) There must be changes in configure.in
>>>>        
>>>>
>
>still "Nothing to pull from"
>
>  
>
>>Please remove all previous versions of reiser4progs. Everything,
>>libaal, libreiser4, etc.
>>    
>>
>
>Did that everywhere.
>
>  
>
>>>When I try to mkfs.reiser4 /dev/sda1 it says:
>>>
>>>ookhoi $ mkfs.reiser4 /dev/sda1
>>>mkfs.reiser4 0.2.0
>>>Copyright (C) 2001, 2002 by Hans Reiser, licensing governed by
>>>reiser4progs/COPYING.
>>>Fatal: Can't initialize plugin factory.
>>>Error: Can't initialize libreiser4.
>>>ookhoi $ echo $?
>>>8
>>>      
>>>
>>It is because libreiser4 was unable to found any plugins (built-in and
>>separate *.so). I will make error messages more detailed.
>>    
>>
>
>Oki, tnx :-)
>
First of all try to make bk pull in 5 minutes.the commited stuff should 
be available.

>
>I see this btw:
>
>ookhoi $ ./prepare-conf
>aclocal
>autoheader
>configure.in:181: warning: AC_TRY_RUN called without default to allow cross compiling
>autoconf
>configure.in:181: warning: AC_TRY_RUN called without default to allow cross compiling
>autoconf: Undefined macros:
>configure.in:148:AC_SYS_LARGEFILE
>configure.in:198:AC_FUNC_MALLOC
>automake --add-missing
>ookhoi $ ./configure > /dev/null
>configure: warning: libuuid could not be found which is required for the --with-uuid
>./configure: line 1098: yes=no: command not found
>./configure: line 1681: AC_SYS_LARGEFILE: command not found
>configure: warning: The headers for libuuid could not be found which
>are required for the --with-uuid option.
>
>./configure: line 6649: AC_FUNC_MALLOC: command not found
>ookhoi $ make > /dev/null
>In file included from /usr/include/stdint.h:26,
>                 from ../include/aal/aal.h:46,
>                 from device.c:8:
>/usr/include/features.h:218:52: operator '==' has no left operand
>make[2]: *** [device.lo] Error 1
>make[1]: *** [all-recursive] Error 1
>make: *** [all-recursive-am] Error 2
>ookhoi $
>
It is apparently because of old version of autoconf, which is not 
supported by us. I'll disable version older then 2.50

>
>ookhoi $ autoconf --version
>Autoconf version 2.13
>
>ookhoi $ gcc --version
>gcc (GCC) 3.2.2 20030109 (Debian prerelease)
>
>Can I provide more info? Is there something you would like me to do?
>
No, thanks a lot :) It was very nice of you :)

>
>
>  
>


-- 
Yury Umanets


