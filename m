From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions
Date: Sat, 28 Jun 2003 00:37:35 +0200
Message-ID: <3EFCC72F.9020100@g-house.de>
References: <3EF9E939.1050501@g-house.de> <20030626092608.GA12252@namesys.com> <3EFAE933.6040206@g-house.de> <20030627092821.GA29715@namesys.com> <3EFC361A.4030009@g-house.de> <20030627122556.GA8753@namesys.com> <3EFC396A.7080808@g-house.de> <20030627123800.GA9214@namesys.com> <20030627161344.GA13908@namesys.com> <3EFC9919.8020308@g-house.de> <20030627211416.GA16091@namesys.com>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14761-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030627211416.GA16091@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Oleg Drokin schrieb:
> Well, the corruptions are different indeed.
> Can you also publish debugreiserfs -d /dev/whateverdev
> output (it is preferable that there would be new FS with only
> one or two files written and immediately unmounted).

i've done so, debugreiserfs-test.stdout is in ../reiserfs on the known
address. let me repeat, that not _all_ files in the fs are corrupted.
the two textfiles i have just written into the newly created reiserfs
are _not_ different from their origins. however, when i copy many files,
a certain amount of files get corrupted.

does it make a difference to test on a file-image or is it better to
continue testing on a "real" block-device?

Thanks,
Chrsitian.

PS: may i ask you, in what timezone you are? i'm not "always online"; to
know *when* you could read my mail could minimize the delay it takes me
to reply :-)


