From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: I oppose Chris and Jeff's patch to add an unnecessary	additional namespace to ReiserFS
Date: Mon, 26 Apr 2004 22:40:37 +0200
Message-ID: <20040426204037.GA21455@merlin.emma.line.org>
References: <1082750045.12989.199.camel@watt.suse.com> <408D3FEE.1030603@namesys.com> <1083000711.30344.44.camel@watt.suse.com> <408D51C4.7010803@namesys.com> <1083006783.30344.102.camel@watt.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18235-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1083006783.30344.102.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Mon, 26 Apr 2004, Chris Mason wrote:

> I hope v4 does improve the xattr api, and I hope it manages to do so for
> more then just reiser4.  It is important that application writers are
> able to code to a single interface and get coverage across all the major
> linux filesystems.

Interesting point, given that SuSE were early adopters of alternative
file systems such as JFS, ReiserFS, and XFS (in lexicographical order
rather than order of appearance). These have always diversified the
semantics offered, not only in adding features that other systems didn't
have, but also in omitting features the other file systems did have -
chattr, for instance, or tail merging that confused boot loaders, for
another.

With respect to Hans's reasoning about name spaces, is there an official
standard that mandates a particular API for the ACL stuff ("POSIX")?

If so, the whole discussion is about getting out of the frying pan and
into the fire. The traditional approach will then be standards compliant
but be out-of-band and outside of the file system name space, the new
approach will be outside of the standards, requiring application
developers to produce a Linux and a POSIX version.

Or am I barking up the wrong tree?

-- 
Matthias Andree

Encrypt your mail: my GnuPG key ID is 0x052E7D95
