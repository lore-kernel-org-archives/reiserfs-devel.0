From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680, minor corruptions
Date: Sat, 28 Jun 2003 16:09:53 +0400
Message-ID: <20030628120953.GA30305@namesys.com>
References: <3EFC361A.4030009@g-house.de> <20030627122556.GA8753@namesys.com> <3EFC396A.7080808@g-house.de> <20030627123800.GA9214@namesys.com> <20030627161344.GA13908@namesys.com> <3EFC9919.8020308@g-house.de> <20030627211416.GA16091@namesys.com> <3EFCC72F.9020100@g-house.de> <20030628095847.GA19610@namesys.com> <3EFD7AC0.10902@g-house.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14778-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EFD7AC0.10902@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <evil@g-house.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Sat, Jun 28, 2003 at 01:23:44PM +0200, Christian Kujau wrote:

> do you still have my .config file ? on my Avanti the option 

Yes, I do. But we have Ruffian alpha.

> "CONFIG_ALPHA_LEGACY_START_ADDRESS=y" was somehow important to get the 
> alpha even started. and perhaps CONFIG_ALPHA_SRM=y too.

I have a config. When I build a kernel using cross compiler - it boots just fine.
If I build kernel using native compiler - it dies when trying to start init.
Config is the same in both cases.

Bye,
    Oleg
