From: Oleg Drokin <green@namesys.com>
Subject: Re: need attrs patch for 2.5.44-ac3
Date: Tue, 29 Oct 2002 09:04:33 +0300
Message-ID: <20021029090433.A5090@namesys.com>
References: <20021026230215.GA3258@yzero> <20021028193322.C1171@namesys.com> <20021029000923.GA527@yzero>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11819-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021029000923.GA527@yzero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Oct 28, 2002 at 07:09:23PM -0500, Tom Vier wrote:
> > On Sat, Oct 26, 2002 at 07:02:15PM -0400, Tom Vier wrote:
> > > is there a 2.5 attrs patch? i can't even list them in 2.5 on a reiserfs. i
> > > get "inappropriate ioctl for device".
> > See attached, I do not claim it will apply cleanly, though.
> > My tree have bunch of other reiserfs pending stuff that was not yet accepted
> > by Linus.
> i fixed it for 2.4.44-ac5 (minor change). lsattr and chattr now work
> properly, but +A has no effect. atime is still updated.

In order for attributes to work you need to mount the volume with -o attrs.
Without that you can only get/set attributes value.

Bye,
    Oleg
