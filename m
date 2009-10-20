From: Viji V Nair <viji@fedoraproject.org>
Subject: Re: reiser4progs-1.0.7 compilation error.
Date: Wed, 21 Oct 2009 00:25:25 +0530
Message-ID: <84c89ac10910201155o7b28aaa1w1fbfa4ee5f6aaa55@mail.gmail.com>
References: <84c89ac10910200135i2f8c3b11q5850d08bb63ab1e0@mail.gmail.com>
	 <4ADD9904.4080202@gmail.com>
	 <84c89ac10910200442m404688e4jcd73173cb97fbbb3@mail.gmail.com>
	 <4ADDADCC.1080603@gmail.com>
	 <84c89ac10910201110o5613a6edv259018698f77e285@mail.gmail.com>
	 <1256062393.3234.0.camel@fz.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=AdrBez4KHupVGNB9ru3hLeYtv3FTqEldZekhBRGXwlg=;
        b=XqDQ5WslLik6v1EEalENnwrpNqBNQmKucAyVWPzOVKD6L1/ASNYyIcWwoDfQHaUlk6
         OuzqDkE6VaRbZuuvoj/9vnbf9vNetvmt+1iZu4u12xEbXx+t+tjucdlGTS/OkkA9wBSm
         izh0QSpaYZpdKIBeGUKvy4F+bl4vhXorsf4GI=
In-Reply-To: <1256062393.3234.0.camel@fz.local>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Felix Zielcke <fzielcke@z-51.de>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

On Tue, Oct 20, 2009 at 11:43 PM, Felix Zielcke <fzielcke@z-51.de> wrot=
e:
> Am Dienstag, den 20.10.2009, 23:40 +0530 schrieb Viji V Nair:
>> Hello
>>
>> I have followed the the documentation you have provided, got the sam=
e
>> result, version issue, here is the exact procedure I have followed.
>>
>> 1. Downloaded the latest stable kernel from kernel.org and applied t=
he
>> reiser4 patch.
>> 2. Used the existing fedora config file as .config and added
>> "CONFIG_REISER4_FS=3Dy" in the filesystem section of the .config fil=
e
>> 3. Complied and installed the new kernel without any error.
>> 4. Rebooted the system from the newly installed kernel
>> =A0 =A0 =A0 # uname -a
>> =A0 =A0 =A0 Linux test01 2.6.31.4 #2 SMP Tue Oct 20 02:35:04 IST 200=
9 x86_64
>> x86_64 x86_64 GNU/Linux
>> =A0 =A0 =A0 # cat /etc/fedora-release
>> =A0 =A0 =A0 Fedora release 11 (Leonidas)
>>
>> 5. Downloaded the libaal from the following link
>>
>> http://www.kernel.org/pub/linux/utils/fs/reiser4/libaal/libaal-1.0.5=
=2Etar.bz2
>>
>> installed to /usr/local and added the lib path to ld.so.conf, the di=
d
>> an ldconfig
>>
>> 6. Downloaded reiser4progs from the following link
>>
>> http://www.kernel.org/pub/linux/utils/fs/reiser4/reiser4progs/reiser=
4progs-1.0.7.tar.bz2
>>
>> tried to install,
>>
>> CFLAGS=3D"-fno-stack-protector -I/usr/local/include"
>> LDFLAGS=3D"-L/usr/local/lib" ./configure
>>
>> got the same result (simple ./configure is also giving the same resu=
lt)
>>
>> <snip>
>> checking for special C compiler options needed for large files... no
>> checking for _FILE_OFFSET_BITS value needed for large files... no
>> configure: WARNING: Can't detect right _FILE_OFFSET_BITS. Will be
>> forced to 64bit.
>> checking for off_t... yes
>> checking size of off_t... 8
>> checking for aal_device_open in -laal... yes
>> checking aal/libaal.h usability... yes
>> checking aal/libaal.h presence... yes
>> checking for aal/libaal.h... yes
>> checking for libaal version =3D 1.0.5... no
>> </snip>
>>
>> I am running the latest updated fedora 11, x86_64. There is a fresh
>> installation, after that did a yum update.
>>
>> Did i miss anything?
>>
>
> Maybe config.log tells something useful why the check for libaal fail=
ed.
>
Here is the config.log

<snip>
configure:23922: checking for aal_device_open in -laal
configure:23957: gcc -o conftest -fno-stack-protector
-I/usr/local/include  -L/usr/local/lib conftest.c -laal   >&5
configure:23963: $? =3D 0
configure:23981: result: yes
configure:24011: checking aal/libaal.h usability
configure:24028: gcc -c -fno-stack-protector -I/usr/local/include
conftest.c >&5
configure:24034: $? =3D 0
configure:24048: result: yes
configure:24052: checking aal/libaal.h presence
configure:24067: gcc -E  conftest.c
configure:24073: $? =3D 0
configure:24087: result: yes
configure:24115: checking for aal/libaal.h
configure:24122: result: yes
configure:24137: checking for libaal version =3D 1.0.5
configure:24168: gcc -o conftest -fno-stack-protector
-I/usr/local/include  -L/usr/local/lib conftest.c -laal  >&5
configure:24174: $? =3D 0
configure:24261: gcc -o conftest -fno-stack-protector
-I/usr/local/include -static  -L/usr/local/lib conftest.c -laal  >&5
/usr/bin/ld: cannot find -lc
collect2: ld returned 1 exit status
configure:24264: $? =3D 1
configure: program exited with status 1
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
</snip>

>
> --
> Felix Zielcke
> Proud Debian Maintainer and GNU GRUB developer
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
