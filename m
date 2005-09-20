From: Stephen Pollei <stephen.pollei@gmail.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 15:08:21 -0700
Message-ID: <feed8cdd050920150866e7925d@mail.gmail.com>
References: <200509201536.j8KFa6wn011651@laptop11.inf.utfsm.cl>
	 <43304A41.7080206@namesys.com>
Reply-To: stephen.pollei@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750863AbVITWIY@vger.kernel.org>
In-Reply-To: <43304A41.7080206@namesys.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Nikita Danilov <nikita@clusterfs.com>, Denis Vlasenko <vda@ilport.com.ua>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On 9/20/05, Hans Reiser <reiser@namesys.com> wrote:
> Horst von Brand wrote:
> >Nikita Danilov <nikita@clusterfs.com> wrote:
> >It is supposed to go into the kernel, which is not exactly warning-free.

> Is that what this thread boils down to, that you guys think the compile
> should fail not warn?

I don't care if it fails or warns at compile time, but you shouldn't
misuse/abuse a warning by potentialily introducing an unrelated bug.

So if you had
#if defined(DEBUG_THIS) || defined(DEBUG_THAT) 
int znode_is_loaded(const struct znode *z);
#else
int znode_is_loaded(const struct znode *z)
  __attribute__((__warn_broken__("unavailible when not debuging")));
#endif
That would be great with me.. except __warn_broken__ or the like
doesn't exist AFAIK :-<
Closest thing is __attribute((__deprecated__)) but thats not quite right.

> >As was said before: It it is /really/ wrong, arrange for it not to compile
> >or not to link. If it isn't, well... then it wasn't that wrong anyway.

That is really true, if it is really wrong then make it so that trying
to do it simply breaks.
And if you are impatient then use a define to substitute crap into the
compile that will give you something you can't ignore as well. Make it
throw off sparks, get bonus points if you can make gcc segfault;->

#define znode_is_loaded(I_dont_care_you_are_going_to_) \
  } )die(]0now[>anyway<}}}}}}*bye*}

should stop a compile, but I don't think it's evil enough to cause gcc
to segfault.
If you didn't like my humor I'm sure you could code something more
concise that is as sick and twisted to crash a compile...
Hmmm. 
#if yadda yadda
int znode_is_loaded_yet_again(....)
#else
#define znode_is_loaded(z) ><<<>
/* break the compile if someone tries using it while not debuging */
#endif

That should break the parser as well. too bad there isn't a
_Pragma("error") or something... oh well.

Also note my opinion, doesn't really count if you grep the kernel
sources for pollei, you won't find anything.

-- 
http://dmoz.org/profiles/pollei.html
http://sourceforge.net/users/stephen_pollei/
http://www.orkut.com/Profile.aspx?uid=2455954990164098214
http://stephen_pollei.home.comcast.net/
