From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: online fsck
Date: Fri, 23 Apr 2004 01:20:12 +0200
Message-ID: <20040422232011.GA9372@merlin.emma.line.org>
References: <20040422150042.5b49c6c3.pegasus@nerv.eu.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18166-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040422150042.5b49c6c3.pegasus@nerv.eu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Thu, 22 Apr 2004, Jure Pe??ar wrote:

> Is it theoretically posible?

It is actually implemented in the BSD kernels, for UFS. Look for
"softdep" or "softupdates".

As for other file systems, when crashing while the write cache is
enabled (unfortunately, it is in FreeBSD for instance), it can royally
screw up your file system. Beyond repair, to a "use your backup" state.

-- 
Matthias Andree

Encrypt your mail: my GnuPG key ID is 0x052E7D95
