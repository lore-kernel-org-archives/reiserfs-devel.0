From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Oops with large file in 2.6.8, reiser 3.6.13
Date: Mon, 29 Nov 2004 14:46:10 -0500
Message-ID: <41AB7C82.8080201@suse.com>
References: <41750864.3060600@liv.ac.uk> <20041024083732.GA25932@backtop.namesys.com> <41821398.3050900@liv.ac.uk> <20041029104624.GO25932@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22619-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041029104624.GO25932@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Zarochentsev <zam@namesys.com>
Cc: Richard Gregory <R.Gregory@liverpool.ac.uk>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alex Zarochentsev wrote:
| Hello,
|
| On Fri, Oct 29, 2004 at 10:55:36AM +0100, Richard Gregory wrote:
|
|>Hi Alex,
|>
|>That fixed it. I created a 617gig file that filled the filesystem. It
|>then deleted without a problem. The delete took a long time, but at
|>least it got there.
|
|
| Thanks a lot.  Your reply is what we needed to make a correct fix.

Alex -

Is the fix in the parent message the "correct" fix? It seems to leave an
if (1 || ...) in, and I've yet to see the fix appear in bk or lkml.

Thanks.

- -Jeff


- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBq3yCLPWxlyuTD7IRAsuxAJ9ruBsMyRhPpNAv8oKdCuGxrhYYYQCfQFYw
Ja1Li6nPFrOzpbj/W7aLXls=
=rfuo
-----END PGP SIGNATURE-----
