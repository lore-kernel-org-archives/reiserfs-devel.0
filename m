From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Oops with large file in 2.6.8, reiser 3.6.13
Date: Mon, 29 Nov 2004 16:17:34 -0500
Message-ID: <41AB91EE.6050505@suse.com>
References: <41750864.3060600@liv.ac.uk>	 <20041024083732.GA25932@backtop.namesys.com> <41821398.3050900@liv.ac.uk>	 <20041029104624.GO25932@backtop.namesys.com>  <41AB7C82.8080201@suse.com> <1101762037.9057.8.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22621-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1101762037.9057.8.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Alex Zarochentsev <zam@namesys.com>, Richard Gregory <R.Gregory@liverpool.ac.uk>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Chris Mason wrote:
| On Mon, 2004-11-29 at 14:46 -0500, Jeff Mahoney wrote:
|
|>-----BEGIN PGP SIGNED MESSAGE-----
|>Hash: SHA1
|>
|>Alex Zarochentsev wrote:
|>| Hello,
|>|
|>| On Fri, Oct 29, 2004 at 10:55:36AM +0100, Richard Gregory wrote:
|>|
|>|>Hi Alex,
|>|>
|>|>That fixed it. I created a 617gig file that filled the filesystem. It
|>|>then deleted without a problem. The delete took a long time, but at
|>|>least it got there.
|>|
|>|
|>| Thanks a lot.  Your reply is what we needed to make a correct fix.
|>
|>Alex -
|>
|>Is the fix in the parent message the "correct" fix? It seems to leave an
|>if (1 || ...) in, and I've yet to see the fix appear in bk or lkml.
|
|
| Jeff, look for subject: reiserfs_do_truncate patch from zam.
|
| -chris
|
|
|

Hey, look at that. I was reviewing unread messages in reiserfs-list, and
happened apon this one. I didn't make the correlation and it didn't get
posted to lkml, so I missed it.

Thanks.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBq5HuLPWxlyuTD7IRAtVGAJ40jniOqYgGc0QlnffTnqV7Cqi09wCdG3WE
Y/03TqtrQM9XHteHtQQnlOc=
=Zcxh
-----END PGP SIGNATURE-----
