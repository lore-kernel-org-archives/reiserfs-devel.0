From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: bug on reiserfs
Date: Sun, 21 Dec 2008 16:33:00 +0300
Message-ID: <494E458C.7050502@gmail.com>
References: <494C477C.3060803@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <494C477C.3060803@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Juan Fco. Giordana" <juangiordana@gmail.com>
Cc: torque@ukrpost.net, reiserfs-devel@vger.kernel.org

Juan Fco. Giordana wrote:
> Actually I don't know if somebody will get this email, but I'll try
> this anyway. I couldn't find a place to report this bug
>
> Try to ./configure  php-5.2.8 on a reiserfs partition formated with
> 'mkreiserfs -b 1024' and mounted as 'notai,noatime'.
>

Hello.
Yes, this is a known problem:
http://bugzilla.kernel.org/show_bug.cgi?id=9108

We'll try to fix it.
Please, use default blocksize for now.

Thanks for report,
Edward.
P.S.:
reiserfs-dev@namesys.com is invalid address.

> Doing this as root will *hang* the system on this configure step:
>
> "checking whether pwrite works..."
>
> Watch the load average grow.
>
> Attached is what I was able to catch. I also had similar problems
> after rebooting withoud doing anything.
>
> On an ext3 partition or a reiserfs partition formated with a 4096
> block size and it worked fine.
>
> Regards


