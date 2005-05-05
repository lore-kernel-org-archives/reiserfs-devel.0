From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 support on parted ...
Date: Thu, 05 May 2005 18:05:51 -0500
Message-ID: <427AA6CF.6000505@slaphack.com>
References: <427A0834.7080201@futuretg.com> <427A99C0.2000105@slaphack.com> <20050505221204.GC8179@gnu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23992-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050505221204.GC8179@gnu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Clausen <clausen@gnu.org>
Cc: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>, Hans Reiser <reiser@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andrew Clausen wrote:
> On Thu, May 05, 2005 at 05:10:08PM -0500, David Masover wrote:
> 
>>To support doing what to Reiser4?
>>
>>"parted" is a disk management project -- specifically, a way to create,
>>delete, and resize partitions.  Think of it as fdisk with nicer units
>>and built-in resizefs tools.
>>
>>This would, I think, involve creating a fully functional
>>resizefs.reiser4 -- something I distinctly remember Hans telling me not
>>to do, because my approach also created (most of) an online repacker,
>>which is something Hans wants to do for money.
> 
> 
> It would be possible to implement mkfs and fsck support only.

Couldn't this just be a wrapper to mkfs.reiser4 and fsck.reiser4?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQnqmz3gHNmZLgCUhAQKOmBAAjbpQILFpIrWZklnisENu16eCrD+o46s4
e2KqdL1ZHjVMmRluZniVXeF3sg98RokkDQNh9s/2YP/5LDXn7ZvKVwEasikxIAgQ
cuYYbKe08aOVE/AtTPkow5QmQje890IT1oo4PNT/qGp+llXCJmlUZmuWgHsdhDOC
32I1b/c/CqBgkjhz67omKZlxMk5v8sI5eykoQa2KtGm+0R7lRgqAa37NSby2KN6e
bMttI20v1Q9hLKaWSDh3TmJTizNPYXFsj0aXexketoDsKgEGwal0JRnyo2EeE2+K
Poer4BYriqbkUY0bVUPrXM1SCh4hn4raHgNXi6PyCDxEcuNe4RvYLsYcuGmfBj1w
2AZTWHcaGZvukAKcu4XFZwgvuAmDXTNCidGFouU3PNxzAAcd2FpvZ/iGYn8+zxOu
ND1/ehilXqIuZ78aP6dGZfm/3EECZxbbE7aDFDSS7q7N6fQWr6dNjwJl1Twds9tk
Uf0su7/+C8lGcE/7qhN/IJJm0YvPKZCaJ/tmNIR/fmFhkqmgWlFJ2Lz+Y6F8mkdX
Da42eDsJ+JD33osyXlq/6Cn8HbNVIwn6xgQX9U8zkVOjgls0vzfce0bkfjfY/UJy
R6YWndilW9KrNF8MBAaaROfaXaKVAG9NhJhkBhx6YU3npbdVKzD8PC90Yim2yuff
/HKQ+QNaM90=
=DyhU
-----END PGP SIGNATURE-----
