From: "David Dabbs" <david@dabbs.net>
Subject: RE: silent semantic changes with reiser4
Date: Wed, 15 Sep 2004 15:23:02 -0500
Message-ID: <20040915202316.730DC15D7B@mail03.powweb.com>
References: <20040915201239.9F1FB15D5E@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21792-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040915201239.9F1FB15D5E@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'ReiserFS List' <reiserfs-list@namesys.com>, linux-kernel@vger.kernel.org, linux-fsdev@vger.rutgers.edu
Cc: 'Timothy Miller' <miller@techsource.com>

> 
> I'm probably not the first to suggest this idea, and it's probably not a
> very good idea, but here's my idea anyhow:
> 
> You have a file "/usr/bin/emacs"
> with a metadata property in the overlaid namespace
> "/usr/bin/emacs/[[..]metas/]icon"
> 
> According to some, this could cause some confusion.  Howabout instead:
> 
> You have a file "/usr/bin/emacs"
> with a metadata property in a slightly separated namespace
> "/metas/usr/bin/emacs/icon"
>

Timothy, see my similar proposal at
http://marc.theaimsgroup.com/?l=reiserfs&m=109511131923831&w=2 
which viro vetoed. I suspect this horse is quite dead.


David




