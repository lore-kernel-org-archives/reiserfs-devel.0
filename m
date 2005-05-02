From: Chris Wakefield <c_wakefield@shaw.ca>
Subject: Re: grub reiser4 won't compile
Date: Mon, 02 May 2005 15:20:00 -0700
Message-ID: <200505021520.00991.c_wakefield@shaw.ca>
References: <200504272226.48234.c_wakefield@shaw.ca>
 <42763E8B.9060906@namesys.com> <b65fbb1305050208176e07aa74@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23961-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <b65fbb1305050208176e07aa74@mail.gmail.com>
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sander Sweers <sander.sweers@gmail.com>, reiserfs-list@namesys.com

On May 2, 2005 08:17 am, Sander Sweers wrote:
> On 02/05/05, Hans Reiser <reiser@namesys.com> wrote:
> > Vitaly, if he is doing something with apt, that means he is probably
> > using debian, which means they may have broken things, which means you
> > need to look into it and fix things and report to me on it.
>
> AFAIK grub does not work in 64bit. It might work compiling with
> CFLAGS="-march=i386 -m32" LDFLAGS="-m32" passed to configure/gcc but i
> am not sure (you need a multilib enviroment). Or as you already said
> in a 32bit chroot.
>
> More info on compiling in 32bit on AMD64 can be found here
> http://lists.debian.org/debian-amd64/2004/08/msg00084.html.
>
> Sander

ls -l /var/cache/apt/archives|grep grub
-rw-r--r--  1 root root   733102 2005-01-17 16:40 
grub_0.95+cvs20040624-13_amd64.deb
-rw-r--r--  1 root root   733396 2005-02-05 07:18 
grub_0.95+cvs20040624-14_amd64.deb
-rw-r--r--  1 root root   733610 2005-02-18 16:18 
grub_0.95+cvs20040624-15_amd64.deb
-rw-r--r--  1 root root   733800 2005-03-21 00:41 
grub_0.95+cvs20040624-16_amd64.deb

This is odd.   I run pure64 amd64 and these packages indicate that they are 64 
bit?

Chris W.
