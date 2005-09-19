From: Stephen Pollei <stephen.pollei@gmail.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Mon, 19 Sep 2005 12:36:15 -0700
Message-ID: <feed8cdd05091912362ac13f3e@mail.gmail.com>
References: <432AFB44.9060707@namesys.com>
	 <200509171416.21047.vda@ilport.com.ua>
	 <17197.15183.235861.655720@gargle.gargle.HOWL>
Reply-To: stephen.pollei@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932553AbVISTgS@vger.kernel.org>
In-Reply-To: <17197.15183.235861.655720@gargle.gargle.HOWL>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <nikita@clusterfs.com>, Alexander Zarochentcev <zam@namesys.com>
Cc: Denis Vlasenko <vda@ilport.com.ua>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Hans Reiser <reiser@namesys.com>

On 9/18/05, Nikita Danilov <nikita@clusterfs.com> wrote:
> Denis Vlasenko writes:
>  > On Friday 16 September 2005 20:05, Hans Reiser wrote:
>  > You can declare functions even if you never use them.
>  > Thus here you can avoid using #if/#endif:
> It's other way around: declaration is guarded by the preprocessor
> conditional so that nobody accidentally use znode_is_loaded() outside of
> the debugging mode.
Except it doesn't disallow someone from using znode_is_loaded, if you
wanted to do that you would have done this....
#if defined(REISER4_DEBUG) || defined(WHATEVER_ELSE)
int znode_is_loaded(const znode * node /* znode to query */ );
#else
#define znode_is_loaded(I_dont_care_you_are_going_to_) \
   } )die(]0now[>anyway<}}}}}}*bye*}
#endif
That way instead of silently(or -Wmissing-prototypes gving a warning)
quessing at a prototype and *maybe* geting a link time error, you get
a nice compile-time bomb-out.

So unless you have -Wmissing-prototypes and -Werror set then your
#if/#endif does very little indeed, especially with the size of kernel
it's easy to ignore yet another warning even if the missing-prototype
warning was set.
And if you would have gotten a link error then that is what you were
really depending on to save your bacon.

P.S. I'd make the define one line if gmail didn't word wrap too much.

-- 
http://dmoz.org/profiles/pollei.html
http://sourceforge.net/users/stephen_pollei/
http://www.orkut.com/Profile.aspx?uid=2455954990164098214
http://stephen_pollei.home.comcast.net/
