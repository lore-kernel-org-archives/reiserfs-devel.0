From: David Masover <ninja@slaphack.com>
Subject: Re: File-level copy-on-write?
Date: Fri, 11 Feb 2005 23:14:07 -0600
Message-ID: <420D909F.5070601@slaphack.com>
References: <420C6A4F.2060905@rolandpj.com> <1108122178.3899.95.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1108122178.3899.95.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: Roland Paterson-Jones <roland@rolandpj.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Vladimir Saveliev wrote:
[...]
|>If not, can I implement this easily (how easily ;) ) with a plugin.
|>
|
| I guess you mean plugin for reiser4?
| You probably can but I do not think that it would be easy.

But, AFAIK it's in the long-term plans, as it's needed for snapshots,
which AFAIK are also in the long-term plans.

|>Any ideas and pointers greatfully received
|
|
| I think it would be easier to modify the application.
| You should probably start with detailed definition of your COW protocol.

I, for one, would appreciate it if you (or someone) would look at how
difficult it would be to implement as a plugin, because it's got to be
done eventually, and won't be done soon by the Namesys guys (AFAIK they
are working on stability right now).

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQg2QnngHNmZLgCUhAQLO5A/9FK7SGjra5rMdQxgBw/0SUuEfYI/+yl55
eVgk3u0pd0QEVfzOc8j80nxP7uRZNGkRTMFT7sPl81npSybg76/G1fUo8miJZaPU
OYZbW8XdaNYnTlpHRkgJegyrryoIWg2lN3/PL4URgONTQ6q4qHFZ/xKjfNpSECGl
ZfZFeaj+myuPYVO/d5qmOOx9uJ4vIC8SJsDlqU9r+gPG6Oe3mXn88Kk72EUfch1T
2bg9fXRfI6L1hx08J3nK6V27VnecMxTicO2Z25EChmnBcxK/2EJMa+qBZo14oC9+
WjZ6Gp+T1Bwmp/qYXaoG1olhIovyHUpT2B8L/1dIw6UJDq8ZSkHpQKWmR1dGzQ7V
SrIxrevw4I3FCJolQGKFOI7NAXN0Alx3t4h50kcPfGfCbgXMcC9oft8JK/R52IqX
Wa7ejHp4ff0nAP4+Olrbe5kugVdSjhuwIXe2lbb6MPpf1jxI5TrNFVKgj8MHmXLL
uESvFEkE0I9GJwSXC6s11ot8LRS//1h/fye0IpgWCcQoa6oyoTJf88ygdFn534u7
dHLMr8SxtJ69W7no2jfQ0TXuxboF2VA7QXBNoS5g+bj4BqwPu2a8HAi1qrH+0rgQ
GmqiM8hw40x+YlqeZj/aj80E7oqpAYjg2ZKd0nSVrxfx4NzW9NF6Rbk7Bi4xegPG
70RSNoupCbQ=
=Oj2l
-----END PGP SIGNATURE-----
