From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Reiser4fs and SPARC64?
Date: Mon, 21 Feb 2005 16:17:26 +0300
Message-ID: <200502211617.26270.vitaly@namesys.com>
References: <421347FD.6000204@d-g-c.de> <200502161724.16258.vitaly@namesys.com> <4219D560.9090904@d-g-c.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4219D560.9090904@d-g-c.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "mailinglists@d-g-c.de" <mailinglists@d-g-c.de>
Cc: reiserfs-list@namesys.com

> libaal-1.0.4.tar.gz compiled fine without any patches.
> but reiser4progs-1.0.4 did not (also no patches!):

do you have a mix of several installed versions in the system?
uninstall, check that nothing left and another try will probably help.

> format40.c:255: warning: type defaults to `int' in declaration of `__tmp'
> format40.c:255: warning: initialization makes integer from pointer
> without a cast

-- 
Thanks,
Vitaly Fertman

