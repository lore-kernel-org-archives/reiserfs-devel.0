From: Stewart Smith <stewart@flamingspork.com>
Subject: Re: Will Reiser4 support a "hidden" attribute?
Date: Thu, 20 Nov 2003 16:18:44 +1100
Message-ID: <1069305523.11497.37.camel@faith>
References: <20031120005844.GC8854@Benine>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16128-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031120005844.GC8854@Benine>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Guido Schimmels <guido.schimmels@freenet.de>
Cc: reiserfs-list@namesys.com

On Thu, 2003-11-20 at 11:58, Guido Schimmels wrote:
> Reiser4? This would be fantastic! I'm planning to use Reiser4 for my  
> Desktop Linux project. I need this feature to hide the Unix legacy tree  
> like MacOS X does it and (back then) BeOS.

Note that MacOS X actually accomplishes this by the GUI having a list
(inside a file named '.hidden') of things not to show.

On my OSX partition, the contents of .hidden is:
automount
bin
cores
Desktop DB
Desktop DF
Desktop Folder
dev
etc
lost+found
mach
mach_kernel
mach.sym
opt
private
sbin
tmp
Trash
usr
var
VM Storage
Volumes


Also, you'll notice that dot files are also hidden it the GUI.

A patch to nautilus to do this would be pretty simple, although then you
get into the problems of hiding a lot of stuff from the user (which you
may not want to).

OSX has the /System and /Library hierarchies that are familiar (enough)
to mac users, and the only parts that are really hidden is all that UNIX
stuff.

Maybe a gnome-vfs layer that interfaced with the packaging system would
make things a bit easier for newbies? i.e. essentially a drag-and-drop
version of apt and dpkg?

If you had a seperate hidden attribute (as well as the dot files
convention) you'd have a lot of old-hat unix people not looking for such
things, and when a 'ls -a' didn't show them, they'd assume they weren't
there. Not good for security.

Although, for things like .snapshot, which are file system provided,
such an approach works fine.

