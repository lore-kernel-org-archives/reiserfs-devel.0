From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 11:47:13 +0100
Message-ID: <20040826104713.GA30449@mail.shareable.org>
References: <Pine.LNX.4.44.0408252052420.13240-100000@chimarrao.boston.redhat.com> <412D968B.9030107@hist.no> <20040826022137.1504ffb7.pj@sgi.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20620-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040826022137.1504ffb7.pj@sgi.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Jackson <pj@sgi.com>
Cc: Helge Hafting <helge.hafting@hist.no>, riel@redhat.com, mikulas@artax.karlin.mff.cuni.cz, torvalds@osdl.org, hch@lst.de, reiser@namesys.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Paul Jackson wrote:
> I find the idea that most backup tools and scripts will silently
> stop working correctly to be pretty scary.  

Too late.  We have xattrs already; many programs don't store them.

-- Jamie
