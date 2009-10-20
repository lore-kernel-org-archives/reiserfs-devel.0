From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4progs-1.0.7 compilation error.
Date: Tue, 20 Oct 2009 21:23:30 +0200
Message-ID: <4ADE0E32.5080100@gmail.com>
References: <84c89ac10910200135i2f8c3b11q5850d08bb63ab1e0@mail.gmail.com>	 <4ADD9904.4080202@gmail.com>	 <84c89ac10910200442m404688e4jcd73173cb97fbbb3@mail.gmail.com>	 <4ADDADCC.1080603@gmail.com>	 <84c89ac10910201110o5613a6edv259018698f77e285@mail.gmail.com>	 <1256062393.3234.0.camel@fz.local>	 <84c89ac10910201155o7b28aaa1w1fbfa4ee5f6aaa55@mail.gmail.com> <1256065288.3234.2.camel@fz.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1256065288.3234.2.camel@fz.local>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Felix Zielcke <fzielcke@z-51.de>
Cc: Viji V Nair <viji@fedoraproject.org>, reiserfs-devel@vger.kernel.org

Felix Zielcke wrote:
> Am Mittwoch, den 21.10.2009, 00:25 +0530 schrieb Viji V Nair:
>   
>> configure:24168: gcc -o conftest -fno-stack-protector
>> -I/usr/local/include  -L/usr/local/lib conftest.c -laal  >&5
>> configure:24174: $? = 0
>> configure:24261: gcc -o conftest -fno-stack-protector
>> -I/usr/local/include -static  -L/usr/local/lib conftest.c -laal  >&5
>> /usr/bin/ld: cannot find -lc
>> collect2: ld returned 1 exit status 
>>     
>
> Looks like you don't have the static libc.a or at least ld couldn't find
> it.

thanks, Felix.

Viji, I think it makes sense to consult with Fedora's libc maintainers..

As per my Fedora 11: I don't upgrade it since my new hp xw4600
can not boot kernels >= 2.6.30 because of bios bug..

Edward.

