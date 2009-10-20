From: Viji V Nair <viji@fedoraproject.org>
Subject: Re: reiser4progs-1.0.7 compilation error.
Date: Tue, 20 Oct 2009 17:12:57 +0530
Message-ID: <84c89ac10910200442m404688e4jcd73173cb97fbbb3@mail.gmail.com>
References: <84c89ac10910200135i2f8c3b11q5850d08bb63ab1e0@mail.gmail.com>
	 <4ADD9904.4080202@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=Amn8euiZ/d5d67r3ocADALatbsS/v9xiJiE4IhA1JTg=;
        b=dieQiMtYZm/PqEme5Q37c18Plt8V4wJ7QzTMJ99atCdXOjLTBNeWg3ymwD3gFCmNE/
         eXHCJro18YQVap797wKIv0TrBx59v1dJH9XmeXJ95uqu2CQNQHkQR4dxz1NzZ3SZJVWf
         Ss6HRyz/onIAiHJLjwsAZLnfukMqvDGA/VlyA=
In-Reply-To: <4ADD9904.4080202@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

I have installed libaal already, it is installed on /usr/local. You
can see that the installer is finding libaal.h

checking for aal/libaal.h... yes

I think the installer is messed up with the version. I have downloaded
the libaal from the following location

http://www.kernel.org/pub/linux/utils/fs/reiser4/libaal/

Also, I am not trying grub with reiserfs4, I just want enable
reiserfs4 support in fedora. I have patched the upstream kernel and
installed the new kernel with reiserfs4 support.  Now, I want the
utilities to manage the same file system.

On Tue, Oct 20, 2009 at 4:33 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Viji V Nair wrote:
>>
>> Hi,
>>
>
> Hello.
>
>> I am trying to compile reiser4progs-1.0.7 on a Fedora 11 64 bit
>> machine and it is throwing the following error.
>>
>> <snip>
>> checking aal/libaal.h usability... yes
>> checking aal/libaal.h presence... yes
>> checking for aal/libaal.h... yes
>> checking for libaal version =3D 1.0.5... no
>> </snip>
>>
>
> make sure you have libaal installed

>
>> I was followed the step in the following URL except the "sed" part.
>> (even with sed it is showing the same error)
>>
>> http://reiser4.wiki.kernel.org/index.php/Reiser4_Howto/GRUB
>>
>
> I am sorry, but it is impossible to build grub with
> reiser4 support with reiser4progs-1.0.7: some
> fixups in configuration files are needed. Also the
> reiser4-grub patch is rather old and I guess we
> need to adjust it to the reiser4 format change that
> occurred 4 years ago, or so.. I still don't have a
> time to look at this.
>
> Thanks,
> Edward.
>
>> The command which I have run is "CFLAGS=3D"-fno-stack-protector
>> -I/usr/local/include" LDFLAGS=3D"-L/usr/local/lib" ./configure"
>>
>> I have installed libaal to /usr/local/ and there is no error while
>> compiling this, add lib path to ldconfig also
>>
>> While googling I have found some old bug releated to this.
>>
>> Any help on the same is greatly appreciated.
>>
>> Viji
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-d=
evel"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>>
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
