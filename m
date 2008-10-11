From: callx <pascalim@gmail.com>
Subject: Reiser4 compile error on vanilla-sources-2.6.27
Date: Fri, 10 Oct 2008 17:31:05 -0700 (PDT)
Message-ID: <19928070.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


I patched vanilla and got no errors. On doing a make this happened:

scripts/kconfig/conf -s arch/x86/Kconfig
    CHK       include/linux/version.h
    CHK       include/linux/utsrelease.h
    CALL      scripts/checksyscalls.sh
    CHK       include/linux/compile
dnsdomainname: Hostname lookup failure
    CC [M]   fs/reiser4/jnode.o
fs/reiser4/jnode.c: In function 'jnode_lock_page':
fs/reiser4/jnode.c:750: error: implicit declaration of function
'TestSetPageLoocked'
make[2]: *** [fs/reiser4/jnode.o] Error 1
make[1]: *** [fs/reiser4] Error 2
make: *** [fs] Error 2

I used this patch:
http://zen-sources.org/files/reiser4-for-2.6.27-rc1.patch
-- 
View this message in context: http://www.nabble.com/Reiser4-compile-error-on-vanilla-sources-2.6.27-tp19928070p19928070.html
Sent from the ReiserFS - General mailing list archive at Nabble.com.

