From: David Masover <ninja@slaphack.com>
Subject: Re: Plugin for corruption resistance?
Date: Wed, 16 Feb 2005 22:10:16 -0600
Message-ID: <42141928.7080608@slaphack.com>
References: <e692861c05021110583585f84e@mail.gmail.com> <4210E3AD.2070008@namesys.com> <loom.20050215T213823-62@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <loom.20050215T213823-62@post.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Adam <kinema@gmail.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Adam wrote:
| Hans Reiser <reiser <at> namesys.com> writes:
|
|
|>Its on the legitimate wish list, if someone wants to code it, let me know.
|>
|>
|
|
| Hans, does this mean that you think that this type of functionality
should be
| implemented as a Reiser4 plugin and therefore in kernelspace?  Why
wouldn't this
| be better implemented in userspace via a daemon that is notified of file
| modification via dnotify/inotify?

Because dnotify/inotify don't scale.  I don't think they lock on event,
either, whereas a plugin could guarentee that the hash was up-to-date
(no race conditions).

We've been over this before.  There's a reason reiser4 and its plugins
are in kernel space, and not in something like Fuse.


===============================
Disclaimer:  I don't work here.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQhQZKHgHNmZLgCUhAQIIDA/+JtV8NjA9GJwbdr7m7yiSunjnEaecP3AP
nK4qfOwMgwZAMyoeeWfq8b66I0AZwSY9u/pAAGoZcqsdxPzaA/1BNoxIVckT1adJ
uszfFiVNo9NHJNdZdn28C7IQbdM8utYLoQ8QiJr4mjmfPsQevxmpqwNqLcuShHwb
+sy0Ckdkq1IjQzntZC60ZIo3J/g5agn1KuRJ1u7mhrG+jA8kEpeTka3j1I8fDbUK
2ODnJE3nV2QIJ32U271OGPBwgC5Zvca0cui4WsYsad0aD3/8KPZibp9rA/RZc8Ud
xD2XtILL8V4skr7Q0G81UzHoj3ISFj9HQgiwaQt7YPie8YeC68AIwOk8ISWSlTIQ
ifyY/1d/JLTpD2qPxemh6yc6Dje71apYeic0YKoOBfd2Ck1LBgwJWwaBPoYQUsYN
f+f41iuaYJRnXYqfI7A5sniXt8pwI/2RQQc31pGyMA6UZXVIgfJnzDZ+uZphGpFf
kiJyRGS7RhgX0DNFVJ9V3jlYHoqIAe4zsDjwdTk3zLO4dnDFVX0M8LeiuXd8bcnM
UA6cODryfvR3ZA3t4GKTm8ir7RYr5mQIhSwN6s0KTJjVmRMBOPWAnCsVgv9t7rjF
cVF1fS9V1VUZFEoatlI9W1Ju1qautIe390z4lPCiBqF0SUaFfkFUa+QPir2TYbTD
9usfiEWzPpM=
=6prc
-----END PGP SIGNATURE-----
