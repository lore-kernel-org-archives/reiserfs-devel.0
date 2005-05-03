From: Hans Reiser <reiser@namesys.com>
Subject: Re: grub reiser4 won't compile
Date: Tue, 03 May 2005 10:50:18 -0700
Message-ID: <4277B9DA.2000602@namesys.com>
References: <200504272226.48234.c_wakefield@shaw.ca>	 <200504281606.42243.vitaly@namesys.com>	 <200504290211.42905.c_wakefield@shaw.ca>	 <200504291519.22561.vitaly@namesys.com> <42763E8B.9060906@namesys.com> <b65fbb1305050208176e07aa74@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23968-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b65fbb1305050208176e07aa74@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sander Sweers <sander.sweers@gmail.com>
Cc: Chris Wakefield <c_wakefield@shaw.ca>, Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

Sander Sweers wrote:

>On 02/05/05, Hans Reiser <reiser@namesys.com> wrote:
>  
>
>>Vitaly, if he is doing something with apt, that means he is probably
>>using debian, which means they may have broken things, which means you
>>need to look into it and fix things and report to me on it.
>>    
>>
>
>AFAIK grub does not work in 64bit. It might work compiling with
>CFLAGS="-march=i386 -m32" LDFLAGS="-m32" passed to configure/gcc but i
>am not sure (you need a multilib enviroment). Or as you already said
>in a 32bit chroot.
>
>More info on compiling in 32bit on AMD64 can be found here
>http://lists.debian.org/debian-amd64/2004/08/msg00084.html.
>
>Sander
>  
>
Yes, Vitaly was right, sorry about that.
