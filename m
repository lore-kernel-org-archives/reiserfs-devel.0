From: Yury Umanets <umka@namesys.com>
Subject: Re: reiserfsprogs compilation on PPC
Date: Thu, 30 Jan 2003 16:24:51 +0300
Message-ID: <3E3927A3.1010902@namesys.com>
References: <1043546126.3e33400e786b1@webmail.cazort.net> <3E37B8F6.9020607@namesys.com> <3E37C7D4.5030906@namesys.com> <3E3891F3.BBBEE09C@cazort.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020102080804090208000901"
Return-path: <reiserfs-list-return-12559-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E3891F3.BBBEE09C@cazort.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: cazort@cazort.net
Cc: reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>

This is a multi-part message in MIME format.
--------------020102080804090208000901
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Alexander Cazort Zorach wrote:

>Hello.
>
>The error messages are abundant, but seem to be all very similar to these:
>
>journal.c:657: undefined reference to `swab32'
>/home/cazort/packages/reiserfsprogs-3.6.4/reiserfscore/journal.c:657:
>relocation truncated to fit: R_PPC_REL24 swab32
>/home/cazort/packages/reiserfsprogs-3.6.4/reiserfscore/journal.c:658:
>undefined reference to `set_bit'
>/home/cazort/packages/reiserfsprogs-3.6.4/reiserfscore/journal.c:658:
>relocation truncated to fit: R_PPC_REL24 set_bit
>../reiserfscore/libcore.a(journal.o): In function `replay_journal':
>/home/cazort/packages/reiserfsprogs-3.6.4/reiserfscore/journal.c:680:
>undefined reference to `swab32'
>/home/cazort/packages/reiserfsprogs-3.6.4/reiserfscore/journal.c:680:
>relocation truncated to fit: R_PPC_REL24 swab32
>/home/cazort/packages/reiserfsprogs-3.6.4/reiserfscore/journal.c:681:
>undefined reference to `swab32'
>/home/cazort/packages/reiserfsprogs-3.6.4/reiserfscore/journal.c:681:
>relocation truncated to fit: R_PPC_REL24 swab32
>/home/cazort/packages/reiserfsprogs-3.6.4/reiserfscore/journal.c:682:
>undefined reference to `swab32'
>/home/cazort/packages/reiserfsprogs-3.6.4/reiserfscore/journal.c:682:
>relocation truncated to fit: R_PPC_REL24 swab32
>/home/cazort/packages/reiserfsprogs-3.6.4/reiserfscore/journal.c:714:
>undefined reference to `set_bit'
>/home/cazort/packages/reiserfsprogs-3.6.4/reiserfscore/journal.c:714:
>relocation truncated to fit: R_PPC_REL24 set_bit
>collect2: ld returned 1 exit status
>make[1]: *** [reiserfsck] Error 1
>make[1]: Leaving directory `/home/cazort/packages/reiserfsprogs-3.6.4/fsck'
>make: *** [all-recursive] Error 1
>
>I don't get any of these when I use 3.6.3.
>
>Alex
>
>Yury Umanets wrote:
>  
>
>>Hans Reiser wrote:
>>
>>    
>>
>>>cazort@cazort.net wrote:
>>>
>>>      
>>>
>>>>Hello.
>>>>I just have a short note that you might want to include on your
>>>>webpage for those PPC users out there.
>>>>===
>>>>I was unable to get reiserfsprogs-3.6.4 to compile on my PPC system.
>>>>However,   I found a discussion thread on google in which
>>>>jbalinc@insight.rr.com   suggested that 3.6.3 compiles fine, and I
>>>>found this old version elsewhere and   was able to successfully
>>>>compile it.  You could either note this, or ideally fix the problem
>>>>(I was unable to do so myself, but I'm not an expert programmer or
>>>>anything).
>>>>===
>>>>Thanks for creating such a great filesystem!    Alex Zorach
>>>>-------------------------------------------------
>>>>This mail sent through IMP: http://horde.org/imp/
>>>>
>>>>
>>>>
>>>>
>>>>        
>>>>
>>>Umka, please engage in that discussion, inform them that we will fix
>>>it, and then fix it after you find out what the bug is.
>>>
>>>      
>>>
>>Hello Alex,
>>
>>Can you specify the message gcc said?
>>
Thank you for report. It seems I've fixed the bug. Actually it appeared 
on all bigendiang platforms.
See attachment for a patch.

>>    
>>
>
>
>  
>


--------------020102080804090208000901
Content-Type: text/plain;
 name="reiserfsprogs-3.6.4-be.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfsprogs-3.6.4-be.patch"

diff -rupN ./reiserfsprogs-3.6.4-orig/include/misc.h reiserfsprogs-3.6.4/include/misc.h
--- ./reiserfsprogs-3.6.4-orig/include/misc.h	Fri Sep 13 14:09:28 2002
+++ reiserfsprogs-3.6.4/include/misc.h	Thu Jan 30 14:42:50 2003
@@ -64,12 +64,12 @@ int le_find_next_zero_bit (const void *v
 # define le64_to_cpu(val)                 (val)
 #elif __BYTE_ORDER == __BIG_ENDIAN
 
-# define cpu_to_le16(val)                 swab16(val)
-# define le16_to_cpu(val)                 swab16(val)
-# define cpu_to_le32(val)                 swab32(val)
-# define le32_to_cpu(val)                 swab32(val)
-# define cpu_to_le64(val)                 swab64(val)
-# define le64_to_cpu(val)                 swab64(val)
+# define cpu_to_le16(val)                 __swab16(val)
+# define le16_to_cpu(val)                 __swab16(val)
+# define cpu_to_le32(val)                 __swab32(val)
+# define le32_to_cpu(val)                 __swab32(val)
+# define cpu_to_le64(val)                 __swab64(val)
+# define le64_to_cpu(val)                 __swab64(val)
 #else
 # error "nuxi/pdp-endian archs are not supported"
 #endif
diff -rupN ./reiserfsprogs-3.6.4-orig/include/swab.h reiserfsprogs-3.6.4/include/swab.h
--- ./reiserfsprogs-3.6.4-orig/include/swab.h	Wed Aug  7 13:12:07 2002
+++ reiserfsprogs-3.6.4/include/swab.h	Thu Jan 30 15:54:17 2003
@@ -4,5 +4,9 @@
 #ifndef _REISERFS_SWAB_H_
 #define _REISERFS_SWAB_H_
 
+#define extern static
+#define __BYTEORDER_HAS_U64__
 #include <linux/byteorder/swab.h>
+#undef extern
+
 #endif /* _REISERFS_SWAB_H_ */
Binary files ./reiserfsprogs-3.6.4-orig/reiserfscore/.prints.c.swp and reiserfsprogs-3.6.4/reiserfscore/.prints.c.swp differ
diff -rupN ./reiserfsprogs-3.6.4-orig/reiserfscore/includes.h reiserfsprogs-3.6.4/reiserfscore/includes.h
--- ./reiserfsprogs-3.6.4-orig/reiserfscore/includes.h	Fri Aug 16 15:07:11 2002
+++ reiserfsprogs-3.6.4/reiserfscore/includes.h	Thu Jan 30 15:40:45 2003
@@ -18,3 +18,5 @@
 #include "io.h"
 #include "misc.h"
 #include "reiserfs_lib.h"
+#include "swab.h"
+

--------------020102080804090208000901--

