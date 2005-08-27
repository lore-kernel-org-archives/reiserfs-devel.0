From: "evilninja@gmx.net" <evilninja@gmx.net>
Subject: Re: Reiser4 oops with 2.6.13-rc6-mm2
Date: Sat, 27 Aug 2005 19:48:49 +0200
Message-ID: <4310A781.9050607@gmx.net>
References: <656cfae8050827090370d11864@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25664-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <656cfae8050827090370d11864@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Ronald Moesbergen <ronald.moesbergen@gmail.com>

Ronald Moesbergen schrieb:
> Hi,
> 
> While running a vmware virtual machine from a reiser4 filesystem, my
> machine consistently locks up and produces the following OOPS:
> 
> kernel: Oops: 0002 [#1]
> kernel: PREEMPT SMP
> kernel: last sysfs file: /class/vc/vcsa8/dev
> kernel: Modules linked in: vmnet vmmon nvidia

is this reproducible and is it reproducible when you don't run this 
inside vmware? the tainted kernel could make it hard to find a solution 
here...

Christian.
