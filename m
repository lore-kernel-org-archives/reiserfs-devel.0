From: Louis Erickson <lerickson@rdwarf.net>
Subject: Re: Erased start of voulme...
Date: Fri, 14 Jan 2005 08:23:42 -0800 (PST)
Message-ID: <Pine.LNX.4.61.0501140818350.24028@holly.rdwarf.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23145-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Wow, thanks for the fast responses, everyone.  I'll try and consolidate 
them all in to one reply, in the order I got them here.

Silly me forgot to start ssh on the afflicted box, so I can't get to it 
until I get home.  I do have another near-identical machine that I've 
checked versions and such on, and can use to build tools if need be.

On Fri, 14 Jan 2005, Sander <sander@humilis.net> wrote:

> What arguments did you use?

reiserfsck --check /dev/md2

> What version of reiserfsck?

How do I find that out?  It isn't in the help or visible as an option.  
If I ask mkfs.reiserfs it tells me it's 3.x.1b (2002).  I suspect it's 
quite old.

Should I build new tools (on another similar machine) and use those 
instead?

> And what filesystem?

It's /dev/md2, mounting on /var.  Linux is unhappy without it, although it 
does come up to single user mode.  Much of the important data is on /home, 
and I can therefore get off if I have to completely rebuild, but there's a 
couple of things (/var/mail, for instance) that would be good to rescue.  
I'd like to try and get a gander at /var/log too, to see if I can suss out 
what happened.

All of this is running on software raid, but the volumes are all up and 
good, and the raid component isn't complaining at all.

Or is that not the question you're asking?

> _And_ it is a lesson why backups are important :-)

Yes it is.  It is past time to fix this astonishing lack in our 
infrastructure.

On Fri, 14 Jan 2005, Alex Zarochentsev <zam@namesys.com> wrote:

> reiserfsck --rebuild-sb can re-create the super block.

I saw that, but it looked dangerous, and I didn't want to try it until my 
copy had finished.

On Fri, 14 Jan 2005, E.Gryaznova <grev@namesys.com> wrote:

> I would prefer to do the following :
> dd if=/dev/problem_partition of=/dev/sparedevice
> sparedevice can be usual disk partition

I don't have a spare partition large enough in this system.  I have done:

dd if=/dev/problem_partition of=/home/scratch/rescue.dat

I'll then use the loopback file system to create a device entry for that 
file, and work on that.  It was a suggestion made earlier on this very 
mailing list, and it sounded like a wise one to me.  If the loopback 
doesn't work, I'll fiddle around with hardware to make a spare partition 
large enough available.

> then
> reiserfsck --rebuild-sb /dev/sparedevice
> reiserfsck --check /dev/sparedevice

The help screen for --rebuild-sb says that a --rebuild-sb will require a 
--rebuild-tree afterwards.  Should I try that, or the --check?  Or will 
--check do the --rebuild-sb as needed?

Also, there's a -S/--scan-whole-partition option... should I use that to 
make sure no files are missed, or would it best not to add that?

Again, thank you all for your quick replies.  It's been very helpful, and 
very positive to hear there are things I can at least try, rather than 
that I am simply hosed.

-- 
Louis Erickson - lerickson@rdwarf.net - http://www.rdwarf.com/~wwonko/

"The human brain is like an enormous fish -- it is flat and slimy and
has gills through which it can see."
		-- Monty Python
