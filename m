From: Yury Umanets <umka@namesys.com>
Subject: Re: build problem BK reiser4progs: /usr/include/features.h:218:52:
 operator '==' has no left operand
Date: Thu, 16 Jan 2003 16:23:47 +0300
Message-ID: <3E26B263.2000909@namesys.com>
References: <20030116102742.I7526@humilis> <3E268CFD.5080604@namesys.com> <20030116120230.J7526@humilis> <3E2692AE.2030704@namesys.com> <20030116121007.L7526@humilis> <3E269499.2090909@namesys.com> <20030116123949.N7526@humilis> <3E26A2A6.702@namesys.com> <20030116133100.O7526@humilis> <3E26A821.4060006@namesys.com> <20030116140405.P7526@humilis>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12389-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030116140405.P7526@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ookhoi@humilis.net
Cc: Reiserfs-List <reiserfs-list@namesys.com>

Ookhoi wrote:

>Yury Umanets wrote (ao):
>  
>
>>First of all try to make bk pull in 5 minutes.the commited stuff
>>should be available.
>>    
>>
>
>Yep, there is something to pull now.
>
>  
>
>>>ookhoi $ make > /dev/null
>>>In file included from /usr/include/stdint.h:26,
>>>               from ../include/aal/aal.h:46,
>>>               from device.c:8:
>>>/usr/include/features.h:218:52: operator '==' has no left operand
>>>make[2]: *** [device.lo] Error 1
>>>make[1]: *** [all-recursive] Error 1
>>>make: *** [all-recursive-am] Error 2
>>>ookhoi $
>>>
>>>      
>>>
>>It is apparently because of old version of autoconf, which is not
>>supported by us. I'll disable version older then 2.50
>>    
>>
>
>Aha, oke. I edited prepare-conf to use the newer tools on my system.
>I also made a tar of the bk clone+pull.
>
>ookhoi $ tar xf reiser4progs.tar
>
Actually you might be use

make dist

>ookhoi $ cd reiser4progs
>ookhoi $ bk pull
>Nothing to pull from bk://namesys.com/bk/reiser4progs
>ookhoi $ cat /tmp/prepare-conf > prepare-conf
>ookhoi $ cat prepare-conf
>echo aclocal-1.4
>aclocal-1.4
>echo autoheader2.50
>autoheader2.50
>echo autoconf2.50
>autoconf2.50
>echo automake-1.4 --add-missing
>automake-1.4 --add-missing
>ookhoi $ ./prepare-conf
>aclocal-1.4
>autoheader2.50
>WARNING: Using auxiliary files such as `acconfig.h', `config.h.bot'
>WARNING: and `config.h.top', to define templates for `config.h.in'
>WARNING: is deprecated and discouraged.
>
>WARNING: Using the third argument of `AC_DEFINE' and
>WARNING: `AC_DEFINE_UNQUOTED' allows to define a template without
>WARNING: `acconfig.h':
>
>WARNING:   AC_DEFINE([NEED_MAIN], 1,
>WARNING:             [Define if a function `main' is needed.])
>
>WARNING: More sophisticated templates can also be produced, see the
>WARNING: documentation.
>

>autoconf2.50
>automake-1.4 --add-missing
>ookhoi $ ./configure > /dev/null
>configure: WARNING: libuuid could not be found which is required for the --with-uuid
>
You should do nothing in this case. Yourbuild of reiser4progs will just 
unable to wotk with uuids.

>
>./configure: line 2786: yes=no: command not found
>
>configure: WARNING: The headers for libuuid could not be found which
>are required for the --with-uuid option.
>
Fixed , thanks

>
>ookhoi $ make > /dev/null
>ookhoi $
>
># find / -name '*reiser4*' | egrep -v '/usr/src|/tmp'
># make install > /dev/null
># find / -name '*reiser4*' | egrep -v '/usr/src|/tmp'
>/usr/local/lib/reiser4
>/usr/local/lib/libreiser4.a
>/usr/local/lib/libreiser4.la
>/usr/local/man/man8/mkfs.reiser4.8
>/usr/local/man/man8/debugfs.reiser4.8
>/usr/local/sbin/make_reiser4
>/usr/local/sbin/debugfs.reiser4
>/usr/local/sbin/fsck.reiser4
>/usr/local/sbin/mkfs.reiser4
>/usr/local/share/aclocal/libreiser4.m4
>/usr/local/include/reiser4
>/usr/local/include/reiser4/reiser4.h
>#
>
>ookhoi $ ldd `which mkfs.reiser4`
>        libncurses.so.5 => /lib/libncurses.so.5 (0x40017000)
>        libreadline.so.4 => /lib/libreadline.so.4 (0x40057000)
>        libc.so.6 => /lib/libc.so.6 (0x40080000)
>        /lib/ld-linux.so.2 => /lib/ld-linux.so.2 (0x40000000)
>ookhoi $
>
># mkfs.reiser4 /dev/sda1
>mkfs.reiser4 0.2.0
>Copyright (C) 2001, 2002 by Hans Reiser, licensing governed by
>reiser4progs/COPYING.
>
>Error: There are no any built-in plugins found.
>Fatal: Can't initialize plugin factory.
>Error: Can't initialize libreiser4.
>#
>
>  
>
Send me please the output of the command

nm libreiser4.so

It seems it doesn't contain plugins at all :) The output should contain 
a lot of __plugin_fini and __plugin_init private symbols.

>  
>
>>>Can I provide more info? Is there something you would like me to do?
>>>
>>>      
>>>
>>No, thanks a lot :) It was very nice of you :)
>>    
>>
>
>You're vere welcome!
>
>
>  
>


-- 
Yury Umanets


