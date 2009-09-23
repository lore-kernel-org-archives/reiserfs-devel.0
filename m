From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4->GRUB
Date: Thu, 24 Sep 2009 00:12:55 +0200
Message-ID: <4ABA9D67.8090709@gmail.com>
References: <85be3c990909080732m2fa251depac3f21b52dae083b@mail.gmail.com>	 <4AA7A22A.30102@gmail.com> <85be3c990909231421i54c548dw7648c0c34f2a8cc6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <85be3c990909231421i54c548dw7648c0c34f2a8cc6@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sinisa Denic <sinisadenic@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Sinisa Denic wrote:
> Hi Edward, I figured out that grub-0.97 with current reiser4 patch can't
> compile with reiser4progs above 1.0.5 because of "objplug" and some more
> dependencies.
>   

Wow,
I thought you've forgotten about grub+reiser4 already.. ;)

> Current set I could compile against reiser4progs but I've been geting a
> linking error about libreiser4-minimal this looks like:
>
> /usr/lib/gcc/x86_64-pc-linux-gnu/4.3.2/../../../../x86_64-pc-linux-gnu/bin/ld:
> skipping incompatible
> /usr/lib/gcc/x86_64-pc-linux-gnu/4.3.2/../../../libreiser4-minimal.a when
> searching for -lreiser4-minimal
>
> I made a few changes and now grub-0.97 can compile against latest
> reiser4progs-1.0.7 but I'm still getting the same error at link stage:
> /usr/lib/gcc/x86_64-pc-linux-gnu/4.3.2/../../../../x86_64-pc-linux-gnu/bin/ld:
> skipping incompatible
> /usr/lib/gcc/x86_64-pc-linux-gnu/4.3.2/../../../libreiser4-minimal.a when
> searching for -lreiser4-minimal
>
> Any idea, what compatibillity is violeted
>   

It seems, that I was inaccurate when releasing reiser4progs>1.0.5
and some version numbers remain not updated. Would you please
grep for "1.0.5" in the latest packages?

Thanks!
Edward.

> Regards, Sinisa
> p.s. There is a little grub(reiser4progs-1.0.5 -1.0.7) - patch in attachment
> On Wed, Sep 9, 2009 at 12:40 PM, Edward Shishkin
> <edward.shishkin@gmail.com>wrote:
>
>   
>> Sinisa Denic wrote:
>>
>>     
>>> Hallo, Edward here Sinisa(Serbia),
>>>
>>>
>>>       
>> Hello.
>>
>>  I've foundout reiserfs until now has been better then ext3 for me,and I
>>     
>>> home
>>> reiser4 will continue such tradition.
>>> So I'm disappointed with fortune of Hans and reiser4, I think he has BAD
>>> luck...
>>> I've some programing experience in kernel programing and I'm intresting in
>>> programming support for reiser4 in GRUB, or may be important things(in
>>> your
>>> opinion)
>>>
>>>
>>>       
>> Yes, it is important.
>>
>>  Would you have some words to me,how to begin, where to start etc.
>>     
>>>       
>> There is a reiser4 patch for grub-0.97. It can be found here:
>> http://ftp.icm.edu.pl/packages/linux-reiserfs/reiser4progs/grub/
>>
>> But I have heard that there are some problems with this.
>> I don't know what is wrong: I didn't test it. It would be great
>> to figure out and fix it. Here you can find the instructions for
>> grub+reiser4 installation:
>>
>> http://web.archive.org/web/20061113154722/http://www.namesys.com/install_v4.html
>>
>> First test it in "safe mode" (grub shell).
>> Try grub shell commands (root, cat, ...) to work with filesystem (reiser4).
>> Use gdb to figure out what is wrong.
>> Please, ask, if something is not clear..
>>
>> Thanks!
>> Edward.
>>
>>     
>
>   

