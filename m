From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: 2.4.24 Oops in find (maybe reiserfs related)
Date: Wed, 21 Jan 2004 02:34:01 +0100
Message-ID: <20040121013401.GB8877@merlin.emma.line.org>
References: <20040120153242.GA19858@merlin.emma.line.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16592-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040120153242.GA19858@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Kernel mailing list <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com

On Tue, 20 Jan 2004, Matthias Andree wrote:

> This happened during the nightly updatedb, which calls find. The hex
> string is "resi", "locate resi" finds a file in a reiserfs file system,
> /usr.
> 
> reiserfsck 3.6.11 afterwards fixed some
> vpf-10680: The file [103048 103049] has the wrong block count in the
> StatData (2) - corrected to (1)

I have put the vmlinux, bzImage, modules and .config available, if
anyone cares to have a look, send me a mail off-list and I'll by happy
to return the URL. Marcello has been mailed the URL.

-- 
Matthias Andree

Encrypt your mail: my GnuPG key ID is 0x052E7D95
