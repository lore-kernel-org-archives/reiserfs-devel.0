From: Hans Reiser <reiser@namesys.com>
Subject: FYI, php compile bug is rc1-mm2 correlated, not reiser4 correlated,
 and not rc2-mm2 correlated
Date: Tue, 23 Nov 2004 11:05:40 -0800
Message-ID: <41A38A04.3060801@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030505080205090905050603"
Return-path: <reiserfs-list-return-22537-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>, Andrew Morton <akpm@osdl.org>

--------------030505080205090905050603
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



--------------030505080205090905050603
Content-Type: message/rfc822;
 name="Re: reiser4 bug"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Re: reiser4 bug"

Return-Path: <reiserfs-dev-return-23335-Reiser=namesys.com@namesys.com>
Delivered-To: Reiser@namesys.com
Received: (qmail 26787 invoked by uid 501); 23 Nov 2004 09:16:17 -0000
Mailing-List: contact reiserfs-dev-help@namesys.com; run by ezmlm
Precedence: bulk
X-No-Archive: yes
list-help: <mailto:reiserfs-dev-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-dev-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-dev@namesys.com>
X-Mailing-List: reiserfs-dev@namesys.com
Delivered-To: mailing list reiserfs-dev@namesys.com
Received: (qmail 26736 invoked by uid 85); 23 Nov 2004 09:16:04 -0000
Received: from grev@namesys.com by thebsh.namesys.com by uid 82 with qmail-scanner-1.15 
 (spamassassin: 2.43-cvs.  Clear:SA:0(0.0/2.0 tests=none autolearn=no version=2.60):. 
 Processed in 1.620419 secs); 23 Nov 2004 09:16:04 -0000
Received: from pier.botik.ru (193.232.174.1)
  by thebsh.namesys.com with SMTP; 23 Nov 2004 09:16:02 -0000
Received: from flint.users.botik.ru ([192.168.52.4]:1543 helo=namesys.com)
	by pier.botik.ru with esmtp (Exim 4.24)
	id 1CWWll-0000IY-66; Tue, 23 Nov 2004 12:15:29 +0300
Message-ID: <41A30A00.70702@namesys.com>
Date: Tue, 23 Nov 2004 12:59:28 +0300
From: "E.Gryaznova" <grev@namesys.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.4) Gecko/20030529
X-Accept-Language: en-us, en
MIME-Version: 1.0
To: Vladimir Saveliev <vs@namesys.com>
CC: reiserfs-dev <reiserfs-dev@namesys.com>
Subject: Re: reiser4 bug
References: <419AAAA3.6060708@namesys.com> <419C85A6.90303@kl-mail.de> <419CAFD2.2000406@namesys.com> <419CB27D.8020502@kl-mail.de> <419CC416.5050403@namesys.com> <419DB245.50103@kl-mail.de> <419E2A86.4030802@namesys.com> <419E2BAC.9060105@kl-mail.de> <419E544A.2050508@namesys.com> <419E7783.4050908@namesys.com> <419E79F6.7030902@kl-mail.de> <419E8B8F.3070100@namesys.com> <419E8A8D.2060907@kl-mail.de> <41A288B7.1030902@namesys.com>
In-Reply-To: <41A288B7.1030902@namesys.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Checker-Version: SpamAssassin 2.60 (1.212-2003-09-23-exp) on 
	thebsh.namesys.com
X-Spam-DCC: : 
X-Spam-Status: No, hits=0.0 required=2.0 tests=none autolearn=no version=2.60

(to be not lost)
This was send to Kai Lippok and cc-ed to reiserfs-dev, but it was 
reterned by thebsh due to long size.

E.Gryaznova wrote:

> Hello.
>
> My investigation shows that php-5.0.2 can not be installed both on 
> reiser4 and ext2 if current kernel is
> 2.6.10-rc1-mm2. Both ext2 and reiser4 fail with the same emerge 
> messages (like you have) :
>
> >>> Test phase [not enabled]: dev-php/php-5.0.2
>
> >>> Install php-5.0.2 into /var/tmp/portage/php-5.0.2/image/ category 
> dev-php
> Installing PHP SAPI module:       embed
> Installing PHP CLI binary:        
> /var/tmp/portage/php-5.0.2/image//usr/bin/
> Installing PHP CLI man page:      
> /var/tmp/portage/php-5.0.2/image//usr/share/man/man1/
> Installing PEAR environment:      
> /var/tmp/portage/php-5.0.2/image//usr/lib/php/
> Could not startup.
> *** glibc detected *** double free or corruption (!prev): 0x081e5178 ***
> make[1]: *** [install-pear-installer] Aborted
> make: *** [install-pear] Error 2
>
> !!! ERROR: dev-php/php-5.0.2 failed.
> !!! Function php5-sapi_src_install, Line 439, Exitcode 2
> !!! install failed
> !!! If you need support, post the topmost build error, NOT this status 
> message.
> ----
>
> BUT: this package php-5.0.2 can be succesfully installed on reiser4 if 
> current kernel is 2.6.10-rc2-mm2 :
>
>
> 1. KERNEL : 2.6.10-rc2-mm2
> ------------------------------------
> # uname -rv
> 2.6.10-rc2-mm2 #1 SMP Tue Nov 23 05:57:20 MSK 2004
> (reiser4 debug ON)
>
> # ACCEPT_KEYWORDS="~x86" emerge  "=php-5.0.2"
>
> >>> dev-php/php-5.0.2 merged.
>
> >>> clean: No packages selected for removal.
>
> >>> Auto-cleaning packages ...
>
> >>> No outdated packages were found on your system.
>
>
> * Regenerating GNU info directory index...
> * Processed 103 info files.
> * IMPORTANT: 6 config files in /etc need updating.
> * Type emerge --help config to learn how to update config files.
>
> # qpkg -I -v -nc | grep 'libc'
> sys-libs/glibc-2.3.4.20041102
>
> # qpkg -I -v -nc | grep 'gcc'
> sys-devel/gcc-3.3.4-r2
> sys-devel/gcc-config-1.3.7-r1
> sys-devel/gcc-3.4.3
>
> # qpkg -I -v -nc | grep 'php'
> dev-php/php-5.0.2
>
> # gcc -v
> Reading specs from /usr/lib/gcc-lib/i386-pc-linux-gnu/3.3.4/specs
> Configured with: 
> /var/tmp/portage/gcc-3.3.4-r2/work/gcc-3.3.4/configure --prefix=/usr 
> --bindir=/usr/i386-pc-linux-gnu/gcc-bin/3.3 
> --includedir=/usr/lib/gcc-lib/i386-pc-linux-gnu/3.3.4/include 
> --datadir=/usr/share/gcc-data/i386-pc-linux-gnu/3.3 
> --mandir=/usr/share/gcc-data/i386-pc-linux-gnu/3.3/man 
> --infodir=/usr/share/gcc-data/i386-pc-linux-gnu/3.3/info 
> --enable-shared --host=i386-pc-linux-gnu --target=i386-pc-linux-gnu 
> --with-system-zlib --enable-languages=c,c++ --enable-threads=posix 
> --enable-long-long --disable-checking --disable-libunwind-exceptions 
> --enable-cstdio=stdio --enable-version-specific-runtime-libs 
> --with-gxx-include-dir=/usr/lib/gcc-lib/i386-pc-linux-gnu/3.3.4/include/g++-v3 
> --with-local-prefix=/usr/local --enable-shared --disable-nls 
> --disable-multilib --enable-__cxa_atexit --enable-clocale=generic
> Thread model: posix
> gcc version 3.3.4 20040623 (Gentoo Linux 3.3.4-r2, ssp-3.3.2-2, 
> pie-8.7.6)
>
> The next unmerging/merging do not fail too :
> # emerge  unmerge php
> ok
> # ACCEPT_KEYWORDS="~x86" emerge -p "=php-5.0.2"
>
> These are the packages that I would merge, in order:
>
> Calculating dependencies ...done!
> [ebuild  N    ] dev-php/php-5.0.2
>
> # ACCEPT_KEYWORDS="~x86" emerge  "=php-5.0.2"
>
> # qpkg -I -v -nc | grep 'php'
> dev-php/php-5.0.2
> =================================================
>
>
>
> 2. KERNEL 2.6.10-rc1-mm2
> # uname -rv
> 2.6.10-rc1-mm2 #2 SMP Tue Nov 23 02:07:11 MSK 2004
>
>
> # ACCEPT_KEYWORDS="~x86" emerge  "=php-5.0.2"
> ...
> Build complete.
> (It is safe to ignore warnings about tempnam and tmpnam).
>
> >>> Test phase [not enabled]: dev-php/php-5.0.2
>
> >>> Install php-5.0.2 into /var/tmp/portage/php-5.0.2/image/ category 
> dev-php
> Installing PHP SAPI module:       embed
> Installing PHP CLI binary:        
> /var/tmp/portage/php-5.0.2/image//usr/bin/
> Installing PHP CLI man page:      
> /var/tmp/portage/php-5.0.2/image//usr/share/man/man1/
> Installing PEAR environment:      
> /var/tmp/portage/php-5.0.2/image//usr/lib/php/
>
> Fatal error: Maximum execution time of 0 seconds exceeded in Unknown 
> on line 0
> make[1]: *** [install-pear-installer] Segmentation fault
> make: *** [install-pear] Error 2
>
> !!! ERROR: dev-php/php-5.0.2 failed.
> !!! Function php5-sapi_src_install, Line 439, Exitcode 2
> !!! install failed
> !!! If you need support, post the topmost build error, NOT this status 
> message.
>
> ======================================================
>
> So, I think that this is not reiser4 problem (because this is 
> reproducible on ext2 too) and I propose you to try 2.6.10-rc2-mm2.
>
> Please let me know if you will fail on installing php over 
> 2.6.10-rc2-mm2 kernel on reiser4
>
> Thanks,
> Lena.
>
> PS: while merging php-5.0.2 fails on reiser4 (-rc1-mm2 kernel) -- 
> there are nothing on my kernel logs.
>
>
> Kai Lippok wrote:
>
>> Please see the attachment.
>>
>> Its 01:00 now and I am going to bed ;)
>>
>> E.Gryaznova schrieb:
>>
>>> is there some reiser4 debug info in kernel logs? if yes -- would you 
>>> please send ?
>>>
>>> Thanks,
>>> Lena
>>>
>>>
>>> Kai Lippok wrote:
>>>
>>>> Hi,
>>>>
>>>> I am sorry to tell you that this does not fix the problem. See 
>>>> attached log. But emerging goes a few bits further now.
>>>>
>>>> E.Gryaznova schrieb:
>>>>
>>>>> Hello again.
>>>>>
>>>>> Would you please try this patch?
>>>>>
>>>>> # cd fs/reiser4
>>>>> # cat reiser4_write-add-access_ok-3.diff | patch -p1
>>>>>
>>>>> Thanks,
>>>>> Lena.
>>>>>
>>>>> E.Gryaznova wrote:
>>>>>
>>>>>> Hello, again.
>>>>>>
>>>>>> Ok, thank you for your work.
>>>>>> Finally I've  reproduced  reiser4 Oops on emerging 
>>>>>> (glibc-2.3.4.20041102 package). I do not know if this the same 
>>>>>> what you have (you did not send me your logs), but the problem 
>>>>>> exists and we will fix it.
>>>>>>
>>>>>> Thanks,
>>>>>> Lena
>>>>>>
>>>>>> Kai Lippok wrote:
>>>>>>
>>>>>>> I have rebuild gcc and glibc with CFLAGS="-march=pentium4 -O2 
>>>>>>> -pipe -fomit-frame-pointer" and CXXFLAGS="${CFLAGS}".
>>>>>>>
>>>>>>> The same error occurs again. The qpkg result is attached.
>>>>>>>
>>>>>>> E.Gryaznova schrieb:
>>>>>>>
>>>>>>>> Hello.
>>>>>>>>
>>>>>>>> 1. Would you please send me output
>>>>>>>>
>>>>>>>> # qpkg -I -v -nc
>>>>>>>>
>>>>>>>> 2. did you try to build gcc 3.3.4-rc2 with default CFLAGS  and 
>>>>>>>> then to build php with defailt CFLAGS?
>>>>>>>> ( There is the citation from make.conf # Please note that if 
>>>>>>>> you experience strange issues with a package, it may be
>>>>>>>> # due to gcc's optimizations interacting in a strange way. 
>>>>>>>> Please test the
>>>>>>>> # package (and in some cases the libraries it uses) at default 
>>>>>>>> optimizations
>>>>>>>> # before reporting errors to developers.
>>>>>>>> )
>>>>>>>>
>>>>>>>> 3. Were anything usefull in logs?
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Lena
>>>>>>>>
>>>>>>>> Kai Lippok wrote:
>>>>>>>>
>>>>>>>>> I switched to kernel 2.6.10-rc2-mm and to an older gcc 
>>>>>>>>> (3.3.4-r2) and tried to compile php5. Same error again. This 
>>>>>>>>> time I compiled via ssh so I can send a log. The 
>>>>>>>>> kernel-messages are not send through ssh, but you can see 
>>>>>>>>> clearly where it hangs. Hope this helps.
>>>>>>>>>
>>>>>>>>> E.Gryaznova schrieb:
>>>>>>>>>
>>>>>>>>>> Kai Lippok wrote:
>>>>>>>>>>
>>>>>>>>>>> Puh,
>>>>>>>>>>>
>>>>>>>>>>> indeed. I tried the current flags before bootstrapping but 
>>>>>>>>>>> some CFLAGS/CXXFLAGS do not work with the old gcc, so I've 
>>>>>>>>>>> removed them. I do not exactly remember which one (can look 
>>>>>>>>>>> when I am at home). But I am sure that I have recompiled at 
>>>>>>>>>>> least gcc with all these new flags after bootstrapping. Do 
>>>>>>>>>>> you think that my selection of CFLAGS is problematic?
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> yes, it is possible. If you have a time  for experiments, you 
>>>>>>>>>> would try to build gcc, etc. with default options and look is 
>>>>>>>>>> this problem reproducible in this case. I could do this by 
>>>>>>>>>> myself, but I need the list of flags you've used.
>>>>>>>>>>
>>>>>>>>>> Thanks,
>>>>>>>>>> Lena.
>>>>>>>>>>
>>>>>>>>>>> I am not so familiar with these settings - just followed a 
>>>>>>>>>>> speed-up guide on gentoo forums.
>>>>>>>>>>>
>>>>>>>>>>> Normally I can connect via ssh to my server at home. 
>>>>>>>>>>> Currently its not available. My feeling says its reiser4 ;-) 
>>>>>>>>>>> Damn...
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> E.Gryaznova schrieb:
>>>>>>>>>>>
>>>>>>>>>>>> Kai Lippok wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>> No problem. But isn't reiser4 part of the kernel and so the
>>>>>>>>>>>>> CFLAGS/CXXFLAGS aren't used!?
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> You said that you used stage 1.  Did you change make.conf 
>>>>>>>>>>>> before bootstrap or after it?
>>>>>>>>>>>> I am not familar with Gentoo. I just want to reproduce 
>>>>>>>>>>>> reiser4 bug and your help is very appritiated for me.  If 
>>>>>>>>>>>> make.conf was changed before bootstrap -- this means that 
>>>>>>>>>>>> glibc, gcc, etc. were built with not default CFLAGS.
>>>>>>>>>>>>
>>>>>>>>>>>> Thanks
>>>>>>>>>>>> Lena.
>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> I am using development-kernel-2.6.10-rc1 (vanilla) with 
>>>>>>>>>>>>> the reiser4
>>>>>>>>>>>>> patch from your server.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Thanks for the work!
>>>>>>>>>>>>>
>>>>>>>>>>>>> E.Gryaznova schrieb:
>>>>>>>>>>>>>
>>>>>>>>>>>>>> Hello,
>>>>>>>>>>>>>> would you please send me your ./etc/make.conf ?
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>>> Lena
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Kai Lippok wrote:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Hi,
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> i am sorry to give you such a bad bug-report, but I 
>>>>>>>>>>>>>>> cannot write to harddisc at the moment the error occurs, 
>>>>>>>>>>>>>>> so I decided to take a picture of my screen.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> The following happens when compiling php-5.0.2 on gentoo 
>>>>>>>>>>>>>>> 2004.2 with kernel 2.6.10-rc1. My hardware is a Celeron 
>>>>>>>>>>>>>>> 2GHz with 512 MB RAM
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> This is my first reiser4 setup and I am a bit confused 
>>>>>>>>>>>>>>> now as it is marked stable.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Thx,
>>>>>>>>>>>>>>> -- 
>>>>>>>>>>>>>>> Kai Lippok     kai.lippok@kl-mail.de
>>>>>>>>>>>>>>> MCDBA / gentoo linux
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
[skipped]
[skipped]

>>>>>>>>> ---------------------------------------------------------------------- 
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Build complete.
>>>>>>>>> (It is safe to ignore warnings about tempnam and tmpnam).
>>>>>>>>>
>>>>>>>>>  
>>>>>>>>>
>>>>>>>>>>>> Test phase [not enabled]: dev-php/php-5.0.2-r1
>>>>>>>>>>>>       
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>
>>>>>>>>>  
>>>>>>>>>
>>>>>>>>>>>> Install php-5.0.2-r1 into 
>>>>>>>>>>>> /var/tmp/portage/php-5.0.2-r1/image/ category dev-php
>>>>>>>>>>>>       
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>> Installing PHP SAPI module:       embed
>>>>>>>>> Installing PHP CLI binary:        
>>>>>>>>> /var/tmp/portage/php-5.0.2-r1/image//usr/bin/
>>>>>>>>> Installing PHP CLI man page:      
>>>>>>>>> /var/tmp/portage/php-5.0.2-r1/image//usr/share/man/man1/
>>>>>>>>> Installing shared extensions:     
>>>>>>>>> /var/tmp/portage/php-5.0.2-r1/image//usr/lib/php/extensions/no-debug-non-zts-20040412/ 
>>>>>>>>>
>>>>>>>>> Installing PEAR environment:      
>>>>>>>>> /var/tmp/portage/php-5.0.2-r1/image//usr/lib/php/
>>>>>>>>> [PEAR] Archive_Tar    - installed: 1.1
>>>>>>>>> make[1]: *** [install-pear-installer] Speicherzugriffsfehler
>>>>>>>>> make: *** [install-pear] Fehler 2
>>>>>>>>>
>>>>>>>>> !!! ERROR: dev-php/php-5.0.2-r1 failed.
>>>>>>>>> !!! Function php5-sapi_src_install, Line 439, Exitcode 2
>>>>>>>>> !!! install failed
>>>>>>>>> !!! If you need support, post the topmost build error, NOT 
>>>>>>>>> this status message.
>>>>>>>>>
>>>>>>>>> hh-kl-srv1 gcc # sync
>>>>>>>>
>>>>>>>>
>>>>>>>>
>> ------------------------------------------------------------------------
>>
>> ------------[ cut here ]------------
>> kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:32!
>> invalid operand: 0000 [#1]
>> PREEMPT
>> Modules linked in: ip_nat_ftp ip_conntrack_ftp ppp_synctty ppp_async 
>> crc_ccitt nfsd exportfs lockd sunrpc capi capifs capability commoncap 
>> sha1 md5 des arc4 ip_gre ppp_mppe_mppc fcpci kernelcapi usbhid 
>> uhci_hcd usbcore ppp_generic slhc 3c59x 8139too msr cpuid ntfs vfat 
>> msdos fat fan button ac
>> CPU:    0
>> EIP:    0060:[<c01cb12e>]    Tainted: P      VLI
>> EFLAGS: 00010282   (2.6.10-rc1)
>> EIP is at get_exclusive_access+0x2e/0x38
>> eax: df23e380   ebx: 00000000   ecx: d17e5d58   edx: 00000000
>> esi: 00000000   edi: d17e5d58   ebp: d17e5d64   esp: d62f9e0c
>> ds: 007b   es: 007b   ss: 0068
>> Process php (pid: 21163, threadinfo=d62f8000 task=d7633590)
>> Stack: c01ca3c5 00000001 d62f9e4c 0000003c 00000000 d194e430 d62f8000 
>> d194e430
>>       00000001 00000001 00000d05 00000000 00000001 d17e5db0 b703f000 
>> d3663980
>>       00000d05 00000d05 c126c7e0 d62f9d34 d2f10780 00000000 00000000 
>> 001e7b3c
>> Call Trace:
>> [<c01ca3c5>] write_unix_file+0x1ae/0x3f7
>> [<c01a2910>] reiser4_write+0x79/0xce
>> [<c0150c87>] vfs_write+0xcd/0x126
>> [<c0150d8b>] sys_write+0x41/0x6a
>> [<c0105f1b>] syscall_call+0x7/0xb
>> Code: 00 e0 ff ff 21 e0 8b 00 8b 80 b8 04 00 00 8b 40 3c 8b 40 08 85 
>> c0 75 13 ba 01 00 ff ff 89 c8 0f c1 10 85 d2 0f 85 b0 0f 00 00 c3 
>> <0f> 0b 20 00 84 d0 30 c0 eb e3 ba ff ff 00 00 0f c1 10 0f 85 a3
>>  
>>
>
>





--------------030505080205090905050603--
