From: doiggl@velocitynet.com.au
Subject: Re: Nightly Builds of reiser4
Date: Fri, 11 Jul 2008 23:58:08 +1000 (EST)
Message-ID: <25202.202.168.22.19.1215784688.squirrel@webmail.velocity.net.au>
References: <48766BD8.3060902@ontolab.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <48766BD8.3060902@ontolab.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "stroetmann@ontolab.com" <stroetmann@ontolab.com>
Cc: reiserfs-devel@vger.kernel.org, jeffm@suse.com

Hello Christian,
I've got no cross-compilation experience, but the following entry may give
some clues:
The opensuse build service (https://build.opensuse.org/) caters for Debian
Etch that may help too.
The development list may me able to assist in some way :-)

The following comes from
http://www.nabble.com/Nightly-Builds-to18036195.html

Jeff wrote
> No, I don't build entire kernels - just the kernel module package. The
> package will just contain
> /lib/modules/$VERSION/kernel/fs/reiser4/reiser4.ko. If you want to boot
> using reiser4, put the module in your initramfs.
> - -Jeff

Also a big thankyou Jeff for all your help.
Cheers Glenn


Christian Wrote:
> Dear Glenn
> I have seen, that you succesfully installed the reiser4 kernel module
> with openSUSE.
> I would like to do it for Debian in the same way. Do you have any ideas
> for doing this?
>
> With best regards
> Christian Stroetmann


