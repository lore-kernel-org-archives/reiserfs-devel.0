From: evilninja <evilninja@gmx.net>
Subject: Re: Reiser4 oops with 2.6.13-rc6-mm2
Date: Sun, 28 Aug 2005 20:10:13 +0200
Message-ID: <4311FE05.70904@gmx.net>
References: <656cfae8050827090370d11864@mail.gmail.com>	 <4310A781.9050607@gmx.net> <656cfae8050827125641d35176@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25679-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <656cfae8050827125641d35176@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Ronald Moesbergen <ronald.moesbergen@gmail.com>

Ronald Moesbergen schrieb:
> Well, I just successfully reproduced this without the nvidia module
> loaded. The oops looks very similar:
[...]
>  kernel: Modules linked in: vmnet vmmon
>  kernel: CPU:    1
>  kernel: EIP:    0060:[lock_object+84/127]    Tainted: P      VLI

well, the kernel is still tainted - by the vmware modules. but as Vladimir
pointed out, there seem to be vmware related issues in reiser4. so you
could wait for the fix or try to reproduce with an untainted kernel (maybe
it's a completly different problem which needs to be fixed).

Christian.
-- 
BOFH excuse #432:

Borg nanites have infested the server
