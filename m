From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680, minor corruptions
Date: Sat, 28 Jun 2003 01:14:16 +0400
Message-ID: <20030627211416.GA16091@namesys.com>
References: <3EF9E939.1050501@g-house.de> <20030626092608.GA12252@namesys.com> <3EFAE933.6040206@g-house.de> <20030627092821.GA29715@namesys.com> <3EFC361A.4030009@g-house.de> <20030627122556.GA8753@namesys.com> <3EFC396A.7080808@g-house.de> <20030627123800.GA9214@namesys.com> <20030627161344.GA13908@namesys.com> <3EFC9919.8020308@g-house.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14759-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EFC9919.8020308@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <evil@g-house.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Fri, Jun 27, 2003 at 09:20:57PM +0200, Christian Kujau wrote:

> 2.5.72 with your patch applied compiled and booted.
> but, i'm almost afraid to say it: vpf-10680 is not gone :-(
> https://ephigenie.kicks-ass.net/browse/reiserfs/vpf-10680/test.log
> is the output of "reiserfsck -l test.log test.img".
> test.img is a 200MB file, right after booting i created a fs on it and 
> copied files to it.
> again, i'll put some files under ../reiserfs/diffs2 just in case the 
> corruptions are different now.

Well, the corruptions are different indeed.
Can you also publish debugreiserfs -d /dev/whateverdev
output (it is preferable that there would be new FS with only
one or two files written and immediately unmounted).

Thank you.

Bye,
    Oleg
