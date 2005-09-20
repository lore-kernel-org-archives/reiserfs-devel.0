From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 13:30:46 +0400
Message-ID: <17199.54982.637650.772991@gargle.gargle.HOWL>
References: <nikita@clusterfs.com>
	<17197.15183.235861.655720@gargle.gargle.HOWL>
	<200509192316.j8JNFxY8030819@inti.inf.utfsm.cl>
	<feed8cdd0509192057e1aa9e3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26117-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <feed8cdd0509192057e1aa9e3@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: stephen.pollei@gmail.com
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Denis Vlasenko <vda@ilport.com.ua>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Stephen Pollei writes:
 > On 9/19/05, Horst von Brand <vonbrand@inf.utfsm.cl> wrote:
 > > Nikita Danilov <nikita@clusterfs.com> wrote:
 > > > It's other way around: declaration is guarded by the preprocessor
 > > > conditional so that nobody accidentally use znode_is_loaded() outside of
 > > > the debugging mode.
 > > 
 > > Since when has a missing declaration prevented anyone calling a function in
 > > C?!

It issues a warning, which is enough, given that reiser4 code was
warning-free most of the time.

 > Never AFAIK... K&R, ANSI,ISO C89,  c99, whatever version that I know of...
 > You'd need -Werror and -Wmissing-prototype to make that worth it.
 > Otherwise the standard says they namesys requested "please make a good

No, evil namesys is not responsible for this, Sir. :-)

 > quess as to what the args are...".
 > K&R didn't even have the kind of prototypes we know and love today...
 > So they shouldn't do this half-ass #if/#endif stuff.. either rip it
 > out, or be a man and make the compile fail when someone calls
 > znode_is_loaded , if thats what you really want. It's really over
 > silly anyway, as it will fail at link time if they had matching
 > preprocessor stuff around the function definition.

Failing (with a warning) at compilation is faster. And people are known
to went as far as to select major compiler version based on the
compilation speed.

Nikita.
