From: Nikita Danilov <Nikita@Clusterfs.COM>
Subject: Re: Fibration questions
Date: Thu, 22 Jul 2004 16:16:06 +0400
Message-ID: <16639.45062.695014.910604@laputa.namesys.com>
References: <20040721054418.1150715C23@mail03.powweb.com>
	<40FE0B47.3010600@slaphack.com>
	<40FF74BA.1050206@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19743-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40FF74BA.1050206@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

Hans Reiser writes:
 > David Masover wrote:
 > 
 > >
 > >
 > > Thus, a fibration plugin must rely on the name to decide how to fibrate
 > > something, because at lookup time, this plugin is asked "I'm looking for
 > > a file named foo, how is that fibrated?"
 > 
 > Yes.
 > 
 > >
 > >
 > >
 > > Also, I think I want to reimplement (a subset of) Lustre using reiser4
 > > as a cache.  If I do any coding, it'll be on that.
 > 
 > You might ask nikita if that is what they hired him away from us for.....
 > 

Nope. :)

Ask Peter Braam (braam@clusterfs.com), whether he has any plans to use
reiser4 as a back-end.

This shouldn't be hard to implement, technically.

 > >
 > >
 > 

Nikita.
