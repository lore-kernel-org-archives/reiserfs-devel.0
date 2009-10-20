From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4progs-1.0.7 compilation error.
Date: Tue, 20 Oct 2009 14:32:12 +0200
Message-ID: <4ADDADCC.1080603@gmail.com>
References: <84c89ac10910200135i2f8c3b11q5850d08bb63ab1e0@mail.gmail.com>	 <4ADD9904.4080202@gmail.com> <84c89ac10910200442m404688e4jcd73173cb97fbbb3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <84c89ac10910200442m404688e4jcd73173cb97fbbb3@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viji V Nair <viji@fedoraproject.org>
Cc: reiserfs-devel@vger.kernel.org

Viji V Nair wrote:
> I have installed libaal already, it is installed on /usr/local. You
> can see that the installer is finding libaal.h
>
> checking for aal/libaal.h... yes
>
> I think the installer is messed up with the version.

Hmm.  Reiser4progs-1.0.7 are built on my
x86_64 machine with Fedora 11 just fine..

I think this is because configuration process
can not find libaal.. Would you please rebuild
with the following instructions:
http://web.archive.org/web/20061113154749/www.namesys.com/install_v4.html

>  I have downloaded
> the libaal from the following location
>
> http://www.kernel.org/pub/linux/utils/fs/reiser4/libaal/
>
> Also, I am not trying grub with reiserfs4,

Actually the correct name is "reiser4".

>  I just want enable
> reiserfs4 support in fedora.

You pointed to Reiser4_Howto/GRUB link
and this misled me..

Edward.
P.S. Reiser4 support in Fedora sounds great.
Please, let me know if you have any troubles..

>  I have patched the upstream kernel and
> installed the new kernel with reiserfs4 support.  Now, I want the
> utilities to manage the same file system.
>
> On Tue, Oct 20, 2009 at 4:33 PM, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>   
>> Viji V Nair wrote:
>>     
>>> Hi,
>>>
>>>       
>> Hello.
>>
>>     
>>> I am trying to compile reiser4progs-1.0.7 on a Fedora 11 64 bit
>>> machine and it is throwing the following error.
>>>
>>> <snip>
>>> checking aal/libaal.h usability... yes
>>> checking aal/libaal.h presence... yes
>>> checking for aal/libaal.h... yes
>>> checking for libaal version = 1.0.5... no
>>> </snip>
>>>
>>>       
>> make sure you have libaal installed
>>     
>
>   
>>> I was followed the step in the following URL except the "sed" part.
>>> (even with sed it is showing the same error)
>>>
>>> http://reiser4.wiki.kernel.org/index.php/Reiser4_Howto/GRUB
>>>
>>>       
>> I am sorry, but it is impossible to build grub with
>> reiser4 support with reiser4progs-1.0.7: some
>> fixups in configuration files are needed. Also the
>> reiser4-grub patch is rather old and I guess we
>> need to adjust it to the reiser4 format change that
>> occurred 4 years ago, or so.. I still don't have a
>> time to look at this.
>>
>> Thanks,
>> Edward.
>>
>>     
>>> The command which I have run is "CFLAGS="-fno-stack-protector
>>> -I/usr/local/include" LDFLAGS="-L/usr/local/lib" ./configure"
>>>
>>> I have installed libaal to /usr/local/ and there is no error while
>>> compiling this, add lib path to ldconfig also
>>>
>>> While googling I have found some old bug releated to this.
>>>
>>> Any help on the same is greatly appreciated.
>>>
>>> Viji
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel"
>>> in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>
>>>       
>>     
>
>   

