From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: usr/include/linux/reiserfs_fs.h is having lot of KERNEL data
Date: Sat, 24 Jan 2009 08:43:13 +0100
Message-ID: <20090124074313.GA31882@uranus.ravnborg.org>
References: <1232465242.3088.25.camel@localhost.localdomain> <1232778934.10414.4.camel@localhost.localdomain> <20090124073236.GA6166@x200.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090124073236.GA6166@x200.localdomain>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Jaswinder Singh Rajput <jaswinder@kernel.org>, reiserfs-devel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> >  
> > -/* debug levels.  Right now, CONFIG_REISERFS_CHECK means print all debug
> > -** messages.
> > -*/
> > +/* debug levels.  Right now, REISERFS_CHECK means print all debug messages */
> 
> Whoa, fix the tool!

This comment does not make sense in userspace so the tool was right - no?

	Sam
