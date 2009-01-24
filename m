From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: usr/include/linux/reiserfs_fs.h is having lot of KERNEL data
Date: Sat, 24 Jan 2009 21:42:16 +0300
Message-ID: <20090124184216.GA7559@x200.localdomain>
References: <1232465242.3088.25.camel@localhost.localdomain> <1232778934.10414.4.camel@localhost.localdomain> <20090124073236.GA6166@x200.localdomain> <20090124074313.GA31882@uranus.ravnborg.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=xhs0Q2OrsOn23fcYcA7nrKqKMEawbSDk9CoUOqSR1bY=;
        b=wr+FoqN8gc80Joh9RhxzKWGDEi+l0pAC9SyBBJ2HZ7h7QXjr2D04on8+GZIKZI+ajP
         7J3PZatABTUJdTJXwzzoL8D5ZkhSUEGVfZoCL5ogvOTS/egwaunwjUPFL3FxPvunulus
         ZXvLi+QJBu+xHRuUktw1lu9xie70VWrqcF0+A=
Content-Disposition: inline
In-Reply-To: <20090124074313.GA31882@uranus.ravnborg.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Jaswinder Singh Rajput <jaswinder@kernel.org>, reiserfs-devel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sat, Jan 24, 2009 at 08:43:13AM +0100, Sam Ravnborg wrote:
> > >  
> > > -/* debug levels.  Right now, CONFIG_REISERFS_CHECK means print all debug
> > > -** messages.
> > > -*/
> > > +/* debug levels.  Right now, REISERFS_CHECK means print all debug messages */
> > 
> > Whoa, fix the tool!
> 
> This comment does not make sense in userspace so the tool was right - no?

Well, one could argue why tool pays attention to comments.
Anyway, this file requires line-by-line checking and making sure reiserfstools
continues to build.
