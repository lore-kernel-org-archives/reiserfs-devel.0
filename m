From: Ingmar Sittl <pizzaboy@web.de>
Subject: Re: Fw: Re: PROBLEM: ReiserFS: cannot remove file as root with 2.6.0test9-mm3
Date: Tue, 18 Nov 2003 16:41:42 +0000
Message-ID: <200311181641.42470.pizzaboy@web.de>
References: <20031117125223.46d784be.akpm@osdl.org> <200311181600.53888.pizzaboy@web.de> <16314.14418.934805.874620@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16119-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16314.14418.934805.874620@laputa.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>, Andrew Morton <akpm@osdl.org>

On Tuesday 18 November 2003 15:18, Nikita Danilov wrote:
> Ingmar Sittl writes:
>
> [...]
>
>  > > Eh? You mean you can remove file when compiled without
>  > > CONFIG_REISERFS_CHECK and fail when compiled with checks on?
>  >
>  > No, I wanted to say that I tried it with -mm3 first without and then
>  > with CONFIG_REISERFS_CHECK and it did not work both times.
>
> So what does `same result' result means for 2.4.21?

it means that I could remove and reinstall this particular file when runnin=
g=20
2.4.21, but when I tried to remove it after rebooting into 2.6.0-test9-mm3,=
=20
rm failed again.

> Also, are there any kernel messages, when kernel is compiled with
> CONFIG_REISERFS_CHECK?
>

No, only the error message from rm. Every information I already sent is fro=
m=20
the kernel with CONFIG_REISERFS_CHECK, but there are no error messages=20
visible when running dmesg or in any of the log files under /var/log.

If you have any idea what else I can check ? I=B4d really like to be helpfu=
l=20
with this.=20

Ingmar

