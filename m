From: Chris Wright <chrisw@osdl.org>
Subject: Re: I oppose Chris and Jeff's patch to add an unnecessary	additional namespace to ReiserFS
Date: Mon, 26 Apr 2004 15:20:18 -0700
Message-ID: <20040426152018.R22989@build.pdx.osdl.net>
References: <1082750045.12989.199.camel@watt.suse.com> <408D3FEE.1030603@namesys.com> <1083000711.30344.44.camel@watt.suse.com> <408D51C4.7010803@namesys.com> <1083006783.30344.102.camel@watt.suse.com> <20040426204037.GA21455@merlin.emma.line.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18236-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040426204037.GA21455@merlin.emma.line.org>; from ma+rfs@dt.e-technik.uni-dortmund.de on Mon, Apr 26, 2004 at 10:40:37PM +0200
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

* Matthias Andree (ma+rfs@dt.e-technik.uni-dortmund.de) wrote:
> With respect to Hans's reasoning about name spaces, is there an official
> standard that mandates a particular API for the ACL stuff ("POSIX")?

POSIX ACL's sit defined in a withdrawn POSIX spec (1003.1e).  The API
doesn't specify the fs/vfs level detail (other than supporting, user,
group, other and mask acls), and gives a userspace API for accessing
the ACL info (with simple functions like acl_get_file() which you should
find in libacl and can fit many os level implementations).  Not sure it
helps much.

thanks,
-chris
-- 
Linux Security Modules     http://lsm.immunix.org     http://lsm.bkbits.net
