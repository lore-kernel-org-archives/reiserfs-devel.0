From: Paul Jackson <pj@sgi.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 04:19:44 -0700
Message-ID: <20040826041944.567b0589.pj@sgi.com>
References: <Pine.LNX.4.44.0408252052420.13240-100000@chimarrao.boston.redhat.com>
	<412D968B.9030107@hist.no>
	<20040826022137.1504ffb7.pj@sgi.com>
	<20040826104713.GA30449@mail.shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20634-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826104713.GA30449@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: helge.hafting@hist.no, riel@redhat.com, mikulas@artax.karlin.mff.cuni.cz, torvalds@osdl.org, hch@lst.de, reiser@namesys.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

> Too late.  We have xattrs already; many programs don't store them.

If by your "too late" you mean we can stop worrying about any more
breakage of file system utilities, because there exists an example
in which some were already broken, then you are absolutely wrong.

Just because we caused some breakage doesn't give us license to cause
even more.

-- 
                          I won't rest till it's the best ...
                          Programmer, Linux Scalability
                          Paul Jackson <pj@sgi.com> 1.650.933.1373
