From: James Lamanna <jlamanna@gmail.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 16:51:00 -0700
Message-ID: <aa4c40ff0509201651723bc624@mail.gmail.com>
References: <aa4c40ff05092015405a23f33a@mail.gmail.com>
	 <Pine.LNX.4.58.0509201644300.14402@shell3.speakeasy.net>
Reply-To: James Lamanna <jlamanna@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750718AbVITXvE@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0509201644300.14402@shell3.speakeasy.net>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vadim Lobanov <vlobanov@speakeasy.net>
Cc: stephen.pollei@gmail.com, vonbrand@inf.utfsm.cl, nikita@clusterfs.com, vda@ilport.com.ua, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On 9/20/05, Vadim Lobanov <vlobanov@speakeasy.net> wrote:
> On Tue, 20 Sep 2005, James Lamanna wrote:
>
> > On 9/20/05, Stephen Pollei <stephen.pollei@gmai.com> wrote:
> > >On 9/20/05, Hans Reiser <reiser@namesys.com> wrote:
> > > > Horst von Brand wrote:
> > > > >Nikita Danilov <nikita@clusterfs.com> wrote:

> > What about #warning / #error in this case?
> >
> > #if defined(DEBUG_THIS) || defined(DEBUG_THAT)
> >     int znode_is_loaded(const struct znode *z);
> > #else
> >     #error znode_is_loaded is unavailable when not debugging
> > #endif
> >
> > That would certainly break the compile.
>
> Except that breaks the compile unconditionally, not just when someone
> tries to use the function when they shouldn't. I don't think a flat
> error will work here, but instead something along the lines of a
> __attribute__((error)) on the function is needed.

Oh duh. It would wouldn't it :)
Too much on my mind today.

>
> > -- James Lamanna
> > -
>
> -VadimL
>

-- James Lamanna
