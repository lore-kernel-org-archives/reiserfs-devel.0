From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: software packaging and ReiserFS v4
Date: Fri, 5 Sep 2003 13:35:47 -0700
Message-ID: <20030905203547.GE19041@matchmail.com>
References: <20030903165409.GD4714@rahul.net> <3F565A8F.4010209@botz.org> <20030903213742.GA13146@rahul.net> <3F58D2CD.3050801@mrs.umn.edu> <20030905194413.GA19041@matchmail.com> <20030905201806.GV31864@vestdata.no>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15583-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030905201806.GV31864@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ragnar Kj?rstad <reiserfs@ragnark.vestdata.no>
Cc: Grant Miner <mine0057@mrs.umn.edu>, Bennett Todd <bet@rahul.net>, reiserfs-list@namesys.com

On Fri, Sep 05, 2003 at 10:18:06PM +0200, Ragnar Kj?rstad wrote:
> On Fri, Sep 05, 2003 at 12:44:13PM -0700, Mike Fedyk wrote:
> > On Fri, Sep 05, 2003 at 01:15:41PM -0500, Grant Miner wrote:
> > > If you are making a packaging system, I recommend you do not allow 
> > > scipts, since they open up a whole can of worms.  (They're impossible to 
> > > invert, introduce security problems, make additional work for GUI 
> > > package managers, and cause too many problems.)
> > 
> > What do you replace them with then?
> 
> I think if scripts were to be removed from the packaging system you
> would have to add a package-feature for every single thing that scripts
> are currently used for. 
> 
> If you look through a collection of packages I think you will find that
> they typically do things like:
> - create users
> - start / stop deamons
> and so on.
> 
> So the package-system would need a way to specify that a user is part of
> the package (that would be very easy with a /etc/passwd.d-system) and
> that deamons that are part of the package should be started at install
> and stopped at uninstall-time.
> 
> There are probably dozens of other examples of common operations - and
> you would not be able to remove the script-feature unless 99% of what
> they are used for is not needed anymore - so it's a complicated task.

Great, so now you have a scripting language in the installer.  What did you
just achieve?

If you want gui integration of the scripts, just make nice wrappers of the
standard unix utilities that create a window saying "creating user x", or
prompting the user for data, or printing a notice.

You could probably even take the ncurses library, and add the wrappers there.

But let the people who want to do this choose the best way...
