From: Tassilo Horn <heimdall@uni-koblenz.de>
Subject: Re: 2.6.16 patch
Date: Mon, 27 Mar 2006 21:44:32 +0200
Message-ID: <871wwnr7tr.fsf@baldur.nicundtas.de>
References: <4417D43A.2070603@namesys.com>
	<3aa654a40603150459q25507248v54f4ffef5e41042d@mail.gmail.com>
	<44185E04.5030307@namesys.com> <44267AAE.60201@free.fr>
	<e09dad$f0p$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28360-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Marcus Furlong <furlongm@hotmail.com> writes:

Hi Marcus,

> There is a unofficial clean-up of the 2.6.15 patch here:
>
> https://www.cs.tcd.ie/~furlongm/reiser4/2.6.16/
>
> along with a clean-up the enable-metas patch.

I tried these two patches which applied fine, but when compiling the
kernel I get:

# LC_ALL=C make
  CHK     include/linux/version.h
  CHK     include/linux/compile.h
  CHK     usr/initramfs_list
  GEN     .version
  CHK     include/linux/compile.h
  UPD     include/linux/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
fs/built-in.o: In function `items_stop':
pseudo.c:(.text+0x8b848): undefined reference to `unlock'
make: *** [.tmp_vmlinux1] Error 1

The mentioned function is:

,----[ fs/reiser4/plugin/pseudo/pseudo.c ]
| /*
|  * stop iteration over a sequence of items for the host file
|  */
| static void items_stop(struct seq_file *m, void *v)
| {
|         unlock(&get_seq_pseudo_host(m)->i_mutex);
|         finish(v);
| }
`----

Any pointer to what could be wrong would be appreciated.

Kind regards,
Tassilo

