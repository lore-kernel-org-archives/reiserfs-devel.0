From: George Karaolides <george.karaolides@planitis.net>
Subject: Re: Quota on Debian with 2.4.18
Date: Tue, 17 Sep 2002 17:21:30 +0300 (EEST)
Sender: George Karaolides <george@coruscant.planitis.net>
Message-ID: <Pine.LNX.4.44.0209171704320.5546-100000@ariel.planitis.net>
References: <3D8735E6.3020104@cc.ysu.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11497-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D8735E6.3020104@cc.ysu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Dalbec <jpdalbec@cc.ysu.edu>
Cc: George Karaolides <george.karaolides@planitis.net>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>


Hi John,

Thanks for your reply.

On Tue, 17 Sep 2002, John Dalbec wrote:

> What does "dpkg -l '*modules*'" say?
>

Nothing very much: just perl modules and pam modules are installed.

The way I do it is, I set EXTRAVERSION in the top-level Makefile to
something different than previous kernels installed on the same machine,
so that the modules are installed in separate subdirectories in
/lib/modules, and installing newly compiled modules does not break the
modules for my previous kernels.

As I've mentioned, I also tried playing with the setting of
CONFIG_MODVERSIONS in the kernel config. without result; depmod -a always
returns unresolved modules errors.

Maybe I've answered my own question here: the only thing I haven't tried
is EXTRAVERSION = (null) in the top-level Makefile.  I'll try that and let
you know.

Best regards,

|   George Karaolides                      Planitis Communications Ltd.,  |
|   tel:   +357 22 45 65 00              Office 102, 11 Florinis Street,  |
|   web:   www.planitis.net                             Nicosia CY 1065,  |
|   email: george.karaolides@planitis.net           Republic  of Cyprus.  |


