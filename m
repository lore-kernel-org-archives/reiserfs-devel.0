From: Vadim Lobanov <vlobanov@speakeasy.net>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 16:46:23 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0509201644300.14402@shell3.speakeasy.net>
References: <aa4c40ff05092015405a23f33a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750706AbVITXqY@vger.kernel.org>
In-Reply-To: <aa4c40ff05092015405a23f33a@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Lamanna <jlamanna@gmail.com>
Cc: stephen.pollei@gmail.com, vonbrand@inf.utfsm.cl, nikita@clusterfs.com, vda@ilport.com.ua, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Tue, 20 Sep 2005, James Lamanna wrote:

> On 9/20/05, Stephen Pollei <stephen.pollei@gmai.com> wrote:
> >On 9/20/05, Hans Reiser <reiser@namesys.com> wrote:
> > > Horst von Brand wrote:
> > > >Nikita Danilov <nikita@clusterfs.com> wrote:
> > > >It is supposed to go into the kernel, which is not exactly warning-free.
>
> > > Is that what this thread boils down to, that you guys think the compile
> > > should fail not warn?
>
> > > I don't care if it fails or warns at compile time, but you shouldn't
> > > misuse/abuse a warning by potentialily introducing an unrelated bug.
> >
> > So if you had
> >#if defined(DEBUG_THIS) || defined(DEBUG_THAT)
> >int znode_is_loaded(const struct znode *z);
> > #else
> > int znode_is_loaded(const struct znode *z)
> >  __attribute__((__warn_broken__("unavailible when not debuging")));
> > #endif
> > That would be great with me.. except __warn_broken__ or the like
> > doesn't exist AFAIK :-<
> > Closest thing is __attribute((__deprecated__)) but thats not quite right.
> > > > As was said before: It it is /really/ wrong, arrange for it not to compile
> > > > or not to link. If it isn't, well... then it wasn't that wrong anyway.
>
> What about #warning / #error in this case?
>
> #if defined(DEBUG_THIS) || defined(DEBUG_THAT)
>     int znode_is_loaded(const struct znode *z);
> #else
>     #error znode_is_loaded is unavailable when not debugging
> #endif
>
> That would certainly break the compile.

Except that breaks the compile unconditionally, not just when someone
tries to use the function when they shouldn't. I don't think a flat
error will work here, but instead something along the lines of a
__attribute__((error)) on the function is needed.

> -- James Lamanna
> -

-VadimL
