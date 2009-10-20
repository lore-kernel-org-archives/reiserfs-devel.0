From: Felix Zielcke <fzielcke@z-51.de>
Subject: Re: reiser4progs-1.0.7 compilation error.
Date: Tue, 20 Oct 2009 20:13:13 +0200
Message-ID: <1256062393.3234.0.camel@fz.local>
References: <84c89ac10910200135i2f8c3b11q5850d08bb63ab1e0@mail.gmail.com>
	 <4ADD9904.4080202@gmail.com>
	 <84c89ac10910200442m404688e4jcd73173cb97fbbb3@mail.gmail.com>
	 <4ADDADCC.1080603@gmail.com>
	 <84c89ac10910201110o5613a6edv259018698f77e285@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <84c89ac10910201110o5613a6edv259018698f77e285@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viji V Nair <viji@fedoraproject.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

Am Dienstag, den 20.10.2009, 23:40 +0530 schrieb Viji V Nair:
> Hello
> 
> I have followed the the documentation you have provided, got the same
> result, version issue, here is the exact procedure I have followed.
> 
> 1. Downloaded the latest stable kernel from kernel.org and applied the
> reiser4 patch.
> 2. Used the existing fedora config file as .config and added
> "CONFIG_REISER4_FS=y" in the filesystem section of the .config file
> 3. Complied and installed the new kernel without any error.
> 4. Rebooted the system from the newly installed kernel
> 	# uname -a
> 	Linux test01 2.6.31.4 #2 SMP Tue Oct 20 02:35:04 IST 2009 x86_64
> x86_64 x86_64 GNU/Linux
> 	# cat /etc/fedora-release
> 	Fedora release 11 (Leonidas)
> 
> 5. Downloaded the libaal from the following link
> 
> http://www.kernel.org/pub/linux/utils/fs/reiser4/libaal/libaal-1.0.5.tar.bz2
> 
> installed to /usr/local and added the lib path to ld.so.conf, the did
> an ldconfig
> 
> 6. Downloaded reiser4progs from the following link
> 
> http://www.kernel.org/pub/linux/utils/fs/reiser4/reiser4progs/reiser4progs-1.0.7.tar.bz2
> 
> tried to install,
> 
> CFLAGS="-fno-stack-protector -I/usr/local/include"
> LDFLAGS="-L/usr/local/lib" ./configure
> 
> got the same result (simple ./configure is also giving the same result)
> 
> <snip>
> checking for special C compiler options needed for large files... no
> checking for _FILE_OFFSET_BITS value needed for large files... no
> configure: WARNING: Can't detect right _FILE_OFFSET_BITS. Will be
> forced to 64bit.
> checking for off_t... yes
> checking size of off_t... 8
> checking for aal_device_open in -laal... yes
> checking aal/libaal.h usability... yes
> checking aal/libaal.h presence... yes
> checking for aal/libaal.h... yes
> checking for libaal version = 1.0.5... no
> </snip>
> 
> I am running the latest updated fedora 11, x86_64. There is a fresh
> installation, after that did a yum update.
> 
> Did i miss anything?
> 

Maybe config.log tells something useful why the check for libaal failed.


-- 
Felix Zielcke
Proud Debian Maintainer and GNU GRUB developer

