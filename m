From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: Feature request: online fsync disable
Date: Sun, 25 Aug 2002 23:21:35 +0200
Message-ID: <m3hehiskgw.fsf@merlin.emma.line.org>
References: <3D661C89.C8A805D7@baldauf.org>
	<15718.8710.244926.960377@laputa.namesys.com>
	<20020823155658.A962@namesys.com> <3D6623BE.4040500@namesys.com>
	<15718.9718.736822.978374@laputa.namesys.com>
	<1030108119.17778.8.camel@tiny> <3D667A7D.5BD60783@baldauf.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11318-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D667A7D.5BD60783@baldauf.org> (Xuan Baldauf's message of
 "Fri, 23 Aug 2002 20:10:05 +0200")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Xuan Baldauf <xuan--reiserfs@baldauf.org> writes:

> It's like that: Crashing with data loss creates trouble, but that trouble is
> fixable. In our case, being slower than required for some time creates much
> more trouble.

So don't call fsync(), or call it less frequently.

-- 
Matthias Andree
