From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfschk --rebuild-tree fails
Date: Wed, 3 Jul 2002 19:41:44 +0400
Message-ID: <20020703194144.A1040@namesys.com>
References: <E17PiOg-0000gJ-00@k6linux2>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10909-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <E17PiOg-0000gJ-00@k6linux2>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: niklaus@mus.ch
Cc: reiserfs-list@namesys.com

Hello!

From: Niklaus Giger <niklaus@namesys.com>
Hm... That From address is weird, I'd say.
I fetched some other address from logs and hope it would work.

On Wed, Jul 03, 2002 at 01:34:09PM +0200, Niklaus Giger wrote:

> Then I tried --rebuild-tree. Output is like this.
> Will rebuild the filesystem (/dev/hda6) tree
> Will put log info to '/home/niklaus/rebuild-tree.log'
> niklaus@k6linux2:/hdb5$ sudo reiserfsck --rebuild-tree -l ~/rebuild-tree.log 
> -z -S /dev/hda6

Are you sure you need to use -S switch, I'd suggest to avoid it.
Also take latest -pre version off our ftp
(ftp://ftp.namesys.com/pub/reiserfsprogs/pre)
If it still fails, report to us what is the problem this time.

Bye,
    Oleg
