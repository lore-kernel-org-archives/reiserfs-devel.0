From: Felix Zielcke <fzielcke@z-51.de>
Subject: Re: reiser4progs-1.0.7 compilation error.
Date: Tue, 20 Oct 2009 21:01:28 +0200
Message-ID: <1256065288.3234.2.camel@fz.local>
References: <84c89ac10910200135i2f8c3b11q5850d08bb63ab1e0@mail.gmail.com>
	 <4ADD9904.4080202@gmail.com>
	 <84c89ac10910200442m404688e4jcd73173cb97fbbb3@mail.gmail.com>
	 <4ADDADCC.1080603@gmail.com>
	 <84c89ac10910201110o5613a6edv259018698f77e285@mail.gmail.com>
	 <1256062393.3234.0.camel@fz.local>
	 <84c89ac10910201155o7b28aaa1w1fbfa4ee5f6aaa55@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <84c89ac10910201155o7b28aaa1w1fbfa4ee5f6aaa55@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viji V Nair <viji@fedoraproject.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

Am Mittwoch, den 21.10.2009, 00:25 +0530 schrieb Viji V Nair:
> configure:24168: gcc -o conftest -fno-stack-protector
> -I/usr/local/include  -L/usr/local/lib conftest.c -laal  >&5
> configure:24174: $? = 0
> configure:24261: gcc -o conftest -fno-stack-protector
> -I/usr/local/include -static  -L/usr/local/lib conftest.c -laal  >&5
> /usr/bin/ld: cannot find -lc
> collect2: ld returned 1 exit status 

Looks like you don't have the static libc.a or at least ld couldn't find
it.

-- 
Felix Zielcke
Proud Debian Maintainer and GNU GRUB developer

