From: Viji V Nair <viji@fedoraproject.org>
Subject: Re: reiser4progs-1.0.7 compilation error.
Date: Tue, 20 Oct 2009 23:40:33 +0530
Message-ID: <84c89ac10910201110o5613a6edv259018698f77e285@mail.gmail.com>
References: <84c89ac10910200135i2f8c3b11q5850d08bb63ab1e0@mail.gmail.com>
	 <4ADD9904.4080202@gmail.com>
	 <84c89ac10910200442m404688e4jcd73173cb97fbbb3@mail.gmail.com>
	 <4ADDADCC.1080603@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=fqFjUqo/3WotGlN4+/waeTWewNQ8m5eGjwXbLoEuPAc=;
        b=vhCE2GxcWxZuwp3+Xty+G6WGAAKAVJNpu+VsUg5welNcshhcCj14QuFjnLT0k6iRD2
         ybyC9dxmZ+Xuaxlg9kf7em2K/j2wlZQfK3z33Ix9l2TtgQ0hvWWH2fu8uAADQGHr/z/9
         +KWeN4ZRxknMu1ryz0EgftPSvreYPy+s4Xxsg=
In-Reply-To: <4ADDADCC.1080603@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hello

I have followed the the documentation you have provided, got the same
result, version issue, here is the exact procedure I have followed.

1. Downloaded the latest stable kernel from kernel.org and applied the
reiser4 patch.
2. Used the existing fedora config file as .config and added
"CONFIG_REISER4_FS=3Dy" in the filesystem section of the .config file
3. Complied and installed the new kernel without any error.
4. Rebooted the system from the newly installed kernel
	# uname -a
	Linux test01 2.6.31.4 #2 SMP Tue Oct 20 02:35:04 IST 2009 x86_64
x86_64 x86_64 GNU/Linux
	# cat /etc/fedora-release
	Fedora release 11 (Leonidas)

5. Downloaded the libaal from the following link

http://www.kernel.org/pub/linux/utils/fs/reiser4/libaal/libaal-1.0.5.ta=
r.bz2

installed to /usr/local and added the lib path to ld.so.conf, the did
an ldconfig

6. Downloaded reiser4progs from the following link

http://www.kernel.org/pub/linux/utils/fs/reiser4/reiser4progs/reiser4pr=
ogs-1.0.7.tar.bz2

tried to install,

CFLAGS=3D"-fno-stack-protector -I/usr/local/include"
LDFLAGS=3D"-L/usr/local/lib" ./configure

got the same result (simple ./configure is also giving the same result)

<snip>
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... no
configure: WARNING: Can't detect right _FILE_OFFSET_BITS. Will be
forced to 64bit.
checking for off_t... yes
checking size of off_t... 8
checking for aal_device_open in -laal... yes
checking aal/libaal.h usability... yes
checking aal/libaal.h presence... yes
checking for aal/libaal.h... yes
checking for libaal version =3D 1.0.5... no
</snip>

I am running the latest updated fedora 11, x86_64. There is a fresh
installation, after that did a yum update.

Did i miss anything?

I think there could be some issue of the installer part which checks
the libaal version. Can u please have a look at it. If you want I can
provide a temporary access to the system.

On Tue, Oct 20, 2009 at 6:02 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Viji V Nair wrote:
>>
>> I have installed libaal already, it is installed on /usr/local. You
>> can see that the installer is finding libaal.h
>>
>> checking for aal/libaal.h... yes
>>
>> I think the installer is messed up with the version.
>
> Hmm. =A0Reiser4progs-1.0.7 are built on my
> x86_64 machine with Fedora 11 just fine..
>
> I think this is because configuration process
> can not find libaal.. Would you please rebuild
> with the following instructions:
> http://web.archive.org/web/20061113154749/www.namesys.com/install_v4.=
html
>
>> =A0I have downloaded
>> the libaal from the following location
>>
>> http://www.kernel.org/pub/linux/utils/fs/reiser4/libaal/
>>
>> Also, I am not trying grub with reiserfs4,
>
> Actually the correct name is "reiser4".
>
>> =A0I just want enable
>> reiserfs4 support in fedora.
>
> You pointed to Reiser4_Howto/GRUB link
> and this misled me..

sorry for this
>
> Edward.
> P.S. Reiser4 support in Fedora sounds great.
> Please, let me know if you have any troubles..
>
>> =A0I have patched the upstream kernel and
>> installed the new kernel with reiserfs4 support. =A0Now, I want the
>> utilities to manage the same file system.
>>
>> On Tue, Oct 20, 2009 at 4:33 PM, Edward Shishkin
>> <edward.shishkin@gmail.com> wrote:
>>
>>>
>>> Viji V Nair wrote:
>>>
>>>>
>>>> Hi,
>>>>
>>>>
>>>
>>> Hello.
>>>
>>>
>>>>
>>>> I am trying to compile reiser4progs-1.0.7 on a Fedora 11 64 bit
>>>> machine and it is throwing the following error.
>>>>
>>>> <snip>
>>>> checking aal/libaal.h usability... yes
>>>> checking aal/libaal.h presence... yes
>>>> checking for aal/libaal.h... yes
>>>> checking for libaal version =3D 1.0.5... no
>>>> </snip>
>>>>
>>>>
>>>
>>> make sure you have libaal installed
>>>
>>
>>
>>>>
>>>> I was followed the step in the following URL except the "sed" part=
=2E
>>>> (even with sed it is showing the same error)
>>>>
>>>> http://reiser4.wiki.kernel.org/index.php/Reiser4_Howto/GRUB
>>>>
>>>>
>>>
>>> I am sorry, but it is impossible to build grub with
>>> reiser4 support with reiser4progs-1.0.7: some
>>> fixups in configuration files are needed. Also the
>>> reiser4-grub patch is rather old and I guess we
>>> need to adjust it to the reiser4 format change that
>>> occurred 4 years ago, or so.. I still don't have a
>>> time to look at this.
>>>
>>> Thanks,
>>> Edward.
>>>
>>>
>>>>
>>>> The command which I have run is "CFLAGS=3D"-fno-stack-protector
>>>> -I/usr/local/include" LDFLAGS=3D"-L/usr/local/lib" ./configure"
>>>>
>>>> I have installed libaal to /usr/local/ and there is no error while
>>>> compiling this, add lib path to ldconfig also
>>>>
>>>> While googling I have found some old bug releated to this.
>>>>
>>>> Any help on the same is greatly appreciated.
>>>>
>>>> Viji
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe
>>>> reiserfs-devel"
>>>> in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.ht=
ml
>>>>
>>>>
>>>>
>>>
>>>
>>
>>
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
