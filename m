From: Spam <spam@tnonline.net>
Subject: Re: reproducable deadlock condition (reiser4)
Date: Sat, 25 Sep 2004 14:48:15 +0200
Message-ID: <559718553.20040925144815@tnonline.net>
References: <1096116193.12503.7.camel@leto.cs.pocnet.net>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21919-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1096116193.12503.7.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christophe Saout <christophe@saout.de>
Cc: reiserfs-list@namesys.com


> Hi,

> it seems I've found a deadlock in reiser4.

> I don't know how it happens, but every time i want to run "emerge php"
> the command compiles php and wants to install it but just before the end
> it hangs (when running some PEAR commands). The whole system freezes a
> couple of seconds after that. /var/log/messages contains some lines
> saying "clong length 0" but these lines never actually get commited to
> disk when the build directory is on the /var volume.

> Interestingly the same deadlock occurs if I try to run the build on
> another volume.

> I've tried it four times so far, always with the same result. The
> filesystems are all clean.

> Should I turn on debugging? I can also provide ssh access to someone if
> he wants to look himself.

> The reiser4 version is from 2.6.9-rc1-mm1, I think.

  Hello :)

  I to had problems with rc1. For example the repacker would also
  freeze my system or corrupt the disk data. But I switched to rc2-mm1
  and since then I have not had any reiser4 errors at all. It could be
  worth a try.

  Maybe try to have the syslog on another device as a temporary
  measure?

  ~S

