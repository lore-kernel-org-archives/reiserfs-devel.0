From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680, minor corruptions
Date: Wed, 25 Jun 2003 09:40:31 +0400
Message-ID: <20030625054031.GA11576@namesys.com>
References: <20030619054535.GA23852@namesys.com> <3EF6AE67.5090502@namesys.com> <20030623090258.GA12259@namesys.com> <3EF6C83F.6060702@namesys.com> <3EF702CC.9050005@g-house.de> <20030624131904.GA460@namesys.com> <3EF86928.7080504@g-house.de> <20030624151940.GC21845@namesys.com> <3EF888B2.4000900@g-house.de> <3EF8EFF0.6020207@g-house.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14692-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EF8EFF0.6020207@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <evil@g-house.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Wed, Jun 25, 2003 at 02:42:24AM +0200, Christian Kujau wrote:
> (/lib/modules/2.5.65/kernel/fs/reiserfs/reiserfs.ko): Invalid module format
> lila:~# uname -a
> Linux lila 2.5.65 #4 Wed Jun 25 00:48:46 CEST 2003 alpha GNU/Linux
> i compiled the module with CONFIG_REISERFS_CHECK=y.
> shall i go on with 2.5.64 or better 2.5.67 ?

Try to compile with CONFIG_REISERFS_CHECK=y the kernel that known-bad for you.
(e.g. 2.5.72/2.5.73)

Bye,
    Oleg
