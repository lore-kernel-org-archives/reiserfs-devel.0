From: callx <pascalim@gmail.com>
Subject: Re: Reiser4 compile error on vanilla-sources-2.6.27
Date: Sun, 12 Oct 2008 02:37:27 -0700 (PDT)
Message-ID: <19939990.post@talk.nabble.com>
References: <19928070.post@talk.nabble.com> <48EFFC5C.30504@alunduil.com> <19929422.post@talk.nabble.com> <48F116CE.7070108@alunduil.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <48F116CE.7070108@alunduil.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


lol, i was trying the patch from andrew this time and I get different errors
now..

http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/reiser4-for-2.6.27.patch.bz2

Kernel: arch/x86/boot/bzImage is ready (#1)
   Building modules, stage 2
   MODPOST 45 modules
ERROR: "swapper_space" [fs/reiser4/reiser4.ko] undefined!
make[1]: *** [__modpost] Error 1
make: *** [modules] Error 2

Am I the only one getting these errors? :(


-- 
View this message in context: http://www.nabble.com/Reiser4-compile-error-on-vanilla-sources-2.6.27-tp19928070p19939990.html
Sent from the ReiserFS - General mailing list archive at Nabble.com.

