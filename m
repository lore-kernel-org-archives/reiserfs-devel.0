From: Hans Reiser <reiser@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 17:44:18 -0700
Message-ID: <4330ACE2.8000909@namesys.com>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl> <432E5024.20709@namesys.com> <20050920075133.GB4074@elf.ucw.cz> <20050921000425.GF6179@thunk.org> <4330A8F2.7010903@emc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26181-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4330A8F2.7010903@emc.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ric Wheeler <ric@emc.com>, vitaly@thebsh.namesys.com
Cc: Theodore Ts'o <tytso@mit.edu>, Pavel Machek <pavel@suse.cz>, Horst von Brand <vonbrand@inf.utfsm.cl>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Ric Wheeler wrote:

> As an earlier thread on lkml showed this summer, we still have a long
> way to go to getting consistent error semantics in face of media
> failures between the various file systems.  I am not sure that we even
> have consensus on what that default behavior should be between
> developers, so image how difficult life is for application writers who
> want to try to ride through or write automated "HA" recovery scripts
> for systems with large numbers of occasionally flaky IO devices ;-)

If you'd like to form a committee to standardize these things, I will
ask Vitaly to work with you on that committee, and to have ReiserFS3+4
conform to the standards that result.

Hans
