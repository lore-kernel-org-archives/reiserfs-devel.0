From: David Masover <ninja@slaphack.com>
Subject: Re: reiserfs3, rsync and hardlinks
Date: Sun, 06 Feb 2005 13:18:52 -0600
Message-ID: <42066D9C.8030908@slaphack.com>
References: <20050206034102.3956432d@polo.concept-micro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050206034102.3956432d@polo.concept-micro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pierre Etchemaite <petchema@concept-micro.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Pierre Etchemaite wrote:
| 	Hi all,
|
| I'm using rsync to make a full backup of one box to another. Both are
using
| reiserfs 3.6.

Go to XFS or Reiser4.  Unless someone is about to correct me, reiserfs3
still has problems with hash collisions.  The rest of it *should* be
stable.... ;-)

If it's mission-critical, you probably want XFS -- reiser4 still has at
least one performance issue to iron out, and it doesn't have the years
of public testing that XFS does.

I don't take the above advice -- I'm adventurous enough to use reiser4
on all my boxes, and I'm reading code as a bedtime story.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQgZtm3gHNmZLgCUhAQLgbBAAjAPSoC52ZfFC6w7rxBVFHVmU/drVHBtn
H/YH+qa4rGVTI63aEiYuQXEln8xjnantikiQDdYb7zEHD0sOLiWgEGEjVf8FW942
HhtLGEZFxgjj6e65/jRDo/+FAobern+k6CktoxyDJawyySbAjnvvjLZwInwnkqPi
tvtlSZjm0P7Y0AwzNg4cxCycKGJI2ZaUJ2wsy2CypZkDqSf6PAedt0Za/qhU34/8
tXHXxkte0hDOjp1SZ30Mh96WsXOu8WfH8wiCX71MZwwZEioY7+apMvQx4LuCXR6b
W64Ug7zu7RygIPWNB61x0kjS9GRF3YoB1kfyQzPMYBi5BaIB33mejiZv1vaTGIuE
kdMwooF0tZ2tY2N8dwELcRP4B4HCF1anmAig+bqElB6VBwLUozFe8DEmQZv3yhrQ
9iPWOm9HGfR/sQVm5M7VGmBK6WeHPC2h747aOAurlsrUSwQNFAdHosVfatVmcFVn
WdqbBi8ryUu1CX/y5sln4E8B/qDciboIoyWPOzDPT44lBkSnYhT9VrYhrYW5lp6U
SfhNHIdT+IkPVpJjCEN08dBPA6Lgw9nn7Caxp7r4cmREJOpWxBOgZoHh4YQBQbZ9
BzgFoVnEZsCuUo1mr3S3ODf6qZ7YZf12ssdKcdflgIDyZYks53zi/E38NLrYWmn0
GkVFUgMiLw4=
=qaQk
-----END PGP SIGNATURE-----
