From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions
Date: Fri, 27 Jun 2003 21:20:57 +0200
Message-ID: <3EFC9919.8020308@g-house.de>
References: <20030625054031.GA11576@namesys.com> <3EF9A0F6.4030401@g-house.de> <3EF9E939.1050501@g-house.de> <20030626092608.GA12252@namesys.com> <3EFAE933.6040206@g-house.de> <20030627092821.GA29715@namesys.com> <3EFC361A.4030009@g-house.de> <20030627122556.GA8753@namesys.com> <3EFC396A.7080808@g-house.de> <20030627123800.GA9214@namesys.com> <20030627161344.GA13908@namesys.com>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14757-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030627161344.GA13908@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

hi,

2.5.72 with your patch applied compiled and booted.
but, i'm almost afraid to say it: vpf-10680 is not gone :-(

https://ephigenie.kicks-ass.net/browse/reiserfs/vpf-10680/test.log

is the output of "reiserfsck -l test.log test.img".
test.img is a 200MB file, right after booting i created a fs on it and 
copied files to it.

again, i'll put some files under ../reiserfs/diffs2 just in case the 
corruptions are different now.

sorry,
Christian.



evil@prinz:~$ ssh alpha

BOFH excuse #439:

Hot Java has gone cold

lila:~# uname -a
Linux lila 2.5.72 #8 Fri Jun 27 19:39:58 CEST 2003 alpha GNU/Linux
lila:~#


