From: Catalin BOIE <util@deuroconsult.ro>
Subject: Re: 2.6.0test3mm2 reiserfs3.6.11 usb-storage
Date: Tue, 19 Aug 2003 09:13:02 +0300 (EEST)
Message-ID: <Pine.LNX.4.56.0308190912140.29654@hosting.rdsbv.ro>
References: <Pine.LNX.4.56.0308181527391.13602@hosting.rdsbv.ro>
 <20030818135827.GA22255@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15374-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030818135827.GA22255@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

> > Failed to open the journal device ((null)).
> > I expect reiserfsck to treat this device as any other device.
> > Mount /dev/sda1 works.
>
> What is "debugreiserfs /dev/sda1" output?

debugreiserfs -d /dev/sda1
debugreiserfs 3.6.11 (2003 www.namesys.com)


debugreiserfs: Failed to open the fs journal.
bash-2.05b# debugreiserfs /dev/sda1
debugreiserfs 3.6.11 (2003 www.namesys.com)


debugreiserfs: Failed to open the fs journal.

I created the fs with command: mkreiserfs -s 513 /dev/sda1

Thanks!

>
> Bye,
>     Oleg
>

---
Catalin(ux) BOIE
catab@deuroconsult.ro
