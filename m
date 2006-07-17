From: Jeffrey Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: fix handling of device names with /'s in them
Date: Sun, 16 Jul 2006 23:17:26 -0400
Message-ID: <44BB0146.7080702@suse.com>
References: <6xQ4C-6NB-43@gated-at.bofh.it> <6xQea-6ZX-13@gated-at.bofh.it> <E1G1QFx-0001IO-K6@be1.lrz> <44B7D97B.20708@suse.com> <44B9E6D5.2040704@namesys.com> <44BA61A2.5090404@suse.com> <44BA8214.7040005@namesys.com> <44BABB14.6070906@suse.com> <44BAE619.9010307@namesys.com> <44BAECE2.8070301@suse.com> <44BAFDC3.7020301@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29022-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44BAFDC3.7020301@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: 7eggert@gmx.de, Eric Dumazet <dada1@cosmosbay.com>, ReiserFS List <reiserfs-list@namesys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@osdl.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> Jeffrey Mahoney wrote:
>> This is not
>> the desired interpretation, which is why we need to replace the pathname
>> separator in the name. ReiserFS is the component that is choosing to use
>> the block device name as a pathname component and is responsible for
>> making any translation to that usage.
> 
> This makes no sense.  I have the feeling you see trees and I see forest.

No, Hans. I see a problem that has been fixed elsewhere in an identical
manner. The real solution is to eliminate / from block devices in the
long run, not to start introducing mount points with different pathname
interpretation rules. Those may have a place elsewhere, after a tough
uphill battle, and are most certainly overkill for this problem.

- -Jeff
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFEuwFFLPWxlyuTD7IRAsiiAJ9cwTuov+2OM7GI44L1wQ/XDBMy9ACeIIYQ
5xEIRCQXHAZFG7oOFEkWJS4=
=onBb
-----END PGP SIGNATURE-----
