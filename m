From: David Masover <ninja@slaphack.com>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 01 Sep 2004 22:52:49 -0500
Message-ID: <41369911.1030503@slaphack.com>
References: <20040829191044.GA10090@thundrix.ch>	 <3247172997-BeMail@cr593174-a> <20040831081528.GA14371@thundrix.ch>	 <20040901201608.GD31934@mail.shareable.org> <1094070506.28509.24.camel@shaggy.austin.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21247-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1094070506.28509.24.camel@shaggy.austin.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Kleikamp <shaggy@austin.ibm.com>
Cc: Jamie Lokier <jamie@shareable.org>, Tonnerre <tonnerre@thundrix.ch>, "Alexander G. M. Smith" <agmsmith@rogers.com>, spam@tnonline.net, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, Linus Torvalds <torvalds@osdl.org>, reiser@namesys.com, Christoph Hellwig <hch@lst.de>, fsdevel <linux-fsdevel@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com, vonbrand@inf.utfsm.cl

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dave Kleikamp wrote:
| On Wed, 2004-09-01 at 15:16, Jamie Lokier wrote:
|
|>(For example, if I edit an HTML file which is encoded in iso-8859-1,
|>change it to utf-8 and indicate that in a META element, and save it
|>under the same name, the full content-type should change from
|>"text/html; charset=iso-8859-1" to "text/html; charset=utf-8".)
|>
|>I don't see how you can do that without kernel support.
|
|
| Your html editor should do that.

Isn't the kernel faced with the same issues here as userland programs
without meta attribute support?  How do you read the META element before
you know the encoding?

Is there property attached to each file descriptor that defines what
encoding it's using?  I know there is in perl, but I doubt it's at the
OS level.  If it is at the OS level, the kernel should use that.

Otherwise I agree -- the html editor should do that.  Although I'd hate
to see Vim patched to do that.  Maybe save it as file/utf8?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQTaZEHgHNmZLgCUhAQLmHxAAif/DzI3HDPPixHEJURTW8LMSBYi+RhgC
Rsldit8G6N9Sx1wKReSZqoTI27OYUodVcXjgtSYbzr9w0dw2ifuLaU87550nCcwl
p/3ivEiPww3Pqc6PgN2PpAhYT2b/xnZrWJSU3g9siGp9D4APBZ4yxz8GO9N8pAgg
a/juHtLCNCtPKD8/IdjCYRn9W7Ka7uWF7cEHp58Yyj0R70EG4ljIRbJRhqKGT2Ew
6EIFcieStmuveA2Kna4Od4gAXIE5CrKEO8whRvplOsvHAlsZMp0zkgUGiKzBzQU0
K7ICkddo3Bnos1pc7BQ/7F595tNCNREqnlvCkWGVifLPdcyujULZ/U/OAVdD7zSJ
AvhZs5A1/hPFYTEqrzSNsYteDsTSc0TJsiWS8gx+qyGzOzaVMAOIuf86jQGKzBT7
WSYutU4itrE1QYvdJ9XXeess8m9aSY1A9G1EkhtWmaRDq/SuCpSf01cNjZZVu52v
Q1h6faCC9JTHM1pDPMBlMjeQOnhrhv/AuhrZnOfXmrODK06l+ZhQ/LSUTRAZwzkv
UV6PSc+Pbq7ijYrurH4attPI8IkelzExhIPHziGQCTMnIN3pXSr6RT2zEtDG7LNR
98MHtKkuNC8bsuYFhyqGRbMLr9GANiByzu3rh1ccHuMbB42FR8/Z7X6UCDVZtP80
Bp4g6WwVG6A=
=xNYt
-----END PGP SIGNATURE-----
