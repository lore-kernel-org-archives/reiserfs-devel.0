From: Guido Schimmels <guido.schimmels@freenet.de>
Subject: Re: Will Reiser4 support a "hidden" attribute?
Date: Thu, 20 Nov 2003 15:23:53 +0100
Message-ID: <20031120142353.GA1253@Benine>
References: <20031120005844.GC8854@Benine> <1069305523.11497.37.camel@faith>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-16131-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1069305523.11497.37.camel@faith> (from stewart@flamingspork.com on Don, Nov 20, 2003 at 06:18:44 +0100)
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: reiserfs-list@namesys.com

Am 20.11.2003 06:18:44 schrieb(en) Stewart Smith:
> On Thu, 2003-11-20 at 11:58, Guido Schimmels wrote:
> > Reiser4? This would be fantastic! I'm planning to use Reiser4 for  
> my
> 
> > Desktop Linux project. I need this feature to hide the Unix legacy
> tree
> > like MacOS X does it and (back then) BeOS.
> 
> Note that MacOS X actually accomplishes this by the GUI having a list
> (inside a file named '.hidden') of things not to show.
> 
> On my OSX partition, the contents of .hidden is:
> automount
> bin
> cores
> Desktop DB
> Desktop DF
> Desktop Folder
> dev
> etc
> lost+found
> mach
> mach_kernel
> mach.sym
> opt
> private
> sbin
> tmp
> Trash
> usr
> var
> VM Storage
> Volumes
>
> 
> Also, you'll notice that dot files are also hidden it the GUI.
> 
> A patch to nautilus to do this would be pretty simple, although then
> you
> get into the problems of hiding a lot of stuff from the user (which
> you
> may not want to).

In fact I've created such a patch for ROX-Filer.

My /.hidden file look like that:

bin
sbin
dev
etc
initrd
lib
lost+found
misc
mnt
home
halt
fastboot
opt
proc
sys
system
tmp
usr
var
uri


But that's only for demonstration purposes. It works Aqua, but not for  
X11 with its multitude of toolkits. Even though my OS is focussed on  
the Gnome developer platform, the occasional Qt, Tk, Motif, Java/Swing  
app is inevitable. Too much work creating and maintaining file-selector  
patches for all of them. GoboLinux provides a kernel patch for that.  
But I don't want to go there. It's a hack.

> OSX has the /System and /Library hierarchies that are familiar
> (enough)
> to mac users, and the only parts that are really hidden is all that
> UNIX
> stuff.
> 
> Maybe a gnome-vfs layer that interfaced with the packaging system
> would
> make things a bit easier for newbies? i.e. essentially a drag-and- 
> drop
> version of apt and dpkg?

My OS has no package manager except for updating the system folder. You  
install applications via drag&drop by means of relocatable application  
folders. And that's not in the planning stage. Consider it done.
 
> If you had a seperate hidden attribute (as well as the dot files
> convention) you'd have a lot of old-hat unix people not looking for
> such
> things, and when a 'ls -a' didn't show them, they'd assume they
> weren't
> there. Not good for security.

Frankly I don't care for "darkness is POSIX standard" dinosaurs.
I care for "enough tinkering already" OS X fugitives.
But you are right, ls -a should show those files. The "hidden"  
attribute should treat flagged files like dotfiles i.e. reveal them  
with ls -a. That's the way my ROX-Filer patch works at least on the GUI  
level.
And there is no need to hide files anywhere else than in / - to where  
btw. all volumes get mounted, the way BeOS did. I chose the BeOS  
directory layout over the NeXT layout. The Unix tree isn't hidden. Only  
the legacy symlinks are. The unix tree lives happily under
/boot/linux/system/posix, /boot/linux/etc and /boot/linux/var
