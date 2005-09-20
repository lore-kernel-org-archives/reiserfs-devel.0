From: Stephen Pollei <stephen.pollei@gmail.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Mon, 19 Sep 2005 20:57:20 -0700
Message-ID: <feed8cdd0509192057e1aa9e3@mail.gmail.com>
References: <nikita@clusterfs.com>
	 <17197.15183.235861.655720@gargle.gargle.HOWL>
	 <200509192316.j8JNFxY8030819@inti.inf.utfsm.cl>
Reply-To: stephen.pollei@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S964869AbVITD5W@vger.kernel.org>
In-Reply-To: <200509192316.j8JNFxY8030819@inti.inf.utfsm.cl>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Nikita Danilov <nikita@clusterfs.com>, Denis Vlasenko <vda@ilport.com.ua>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On 9/19/05, Horst von Brand <vonbrand@inf.utfsm.cl> wrote:
> Nikita Danilov <nikita@clusterfs.com> wrote:
> > It's other way around: declaration is guarded by the preprocessor
> > conditional so that nobody accidentally use znode_is_loaded() outside of
> > the debugging mode.
> 
> Since when has a missing declaration prevented anyone calling a function in
> C?!
Never AFAIK... K&R, ANSI,ISO C89,  c99, whatever version that I know of...
You'd need -Werror and -Wmissing-prototype to make that worth it.
Otherwise the standard says they namesys requested "please make a good
quess as to what the args are...".
K&R didn't even have the kind of prototypes we know and love today...
So they shouldn't do this half-ass #if/#endif stuff.. either rip it
out, or be a man and make the compile fail when someone calls
znode_is_loaded , if thats what you really want. It's really over
silly anyway, as it will fail at link time if they had matching
preprocessor stuff around the function definition.
#if defined(DEBUG_THIS) || defined(DEBUG_THAT)
int znode_is_loaded(const znode * node) {return !!node->had_too_much_to_drink;}
#endif

-- 
http://dmoz.org/profiles/pollei.html
http://sourceforge.net/users/stephen_pollei/
http://www.orkut.com/Profile.aspx?uid=2455954990164098214
http://stephen_pollei.home.comcast.net/
