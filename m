From: Matt Stegman <matts@ksu.edu>
Subject: Sudden FS Corruption
Date: Tue, 2 Sep 2003 23:59:04 -0500 (CDT)
Message-ID: <200309030457.h834vpr4023818@mailq1.cc.ksu.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15522-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello,

I just got some corruption on my reiserfs /usr filesystem tonight.  I
think it may be related to hardware problems, but I'm not sure.

Now, my motherboard has two onboard IDE controllers - a VIA and a
Promise.  I've got one hard disk on each controller, an 80GB and a 60Gb
respectively (both IBM Deskstar series).  The computer is dual boot, Windows and Linux, and has
been rebooted fairly often the last couple weeks.  Today and yesterday
I've noticed that on some boots, the Promise controller does not see the
disk attached to it.  If I reboot again, nothing changes, if I power
down for a minute and power back up, it sees the disk again.

So tonight, I ran a 'badblocks -sv' (read-only) test on the drive which
isn't always detected.  It finished with no errors.

After this, I ran 'emerge sync' (a Gentoo thing, which checks for new
packages) which told me to upgrade portage when it completed.  I did so,
and the new portage package installed OK.

I also upgraded mplayer - not through portage, but compiling by hand and
installing in /usr/local.

I played a couple movies with mplayer.  It ran (crashed a couple times,
which I don't belive is related to the corruption).

I did some other things (surf web, check email, do homework, etc).
During none of this did I have any problem.  And all of these programs
are installed on /usr.  Later, I tried running mplayer again, and got:

-bash: /usr/local/bin/mplayer: cannot execute binary file

The mplayer file was filled with garbage.  I probably should have
preserved a copy, but I deleted it, and tried to reinstall (this time
via portage: 'emerge mplayer').  Now I get:

-bash: /usr/bin/emerge: cannot execute binary file

Now, the common thread here is that both these files are on /usr, and
both files were modified tonight (/usr/bin/emerge is part of the portage
package, which I had just upgraded).  After I got this, I rebooted and
ran reiserfsck, which found no errors.  I also have found other files on
/usr which are corrupted.  Now, files which were written before tonight
appear to be all A-OK.  And not all files written tonight have been
replaced by garbage.  Man pages installed with mplayer were fine.

Here's the first bit of what's now in /usr/bin/emerge (the file should
normally be a python script):

n2.2/compiler/ast.pys^M^@^@^@getChildNodes<F1>^Bs^B^@^@^@^@^Ac^A^@^A^@^E^@^C^@s0^@^@^@d^A^@t^@^@|^@^@i^B^@<83>^A^@t^@^@|^@^@i^C^@<83>^A^@t^@^@|^@^@i^D^@<83>^A^@f^C^@^VSd^@^@S(^B^@^@^@Ns^S^@^@^@AssAttr(%s, %s,%s)(^E^@^@^@s^D^@^@^@reprs^D^@^@^@selfs^D^@^@^@expr^@^@^@attrnames^E^@^@^@flags(^A^@^@^@s^D^@^@^@self(^@^@^@^@(^@^@^@^@sF^@^@^@/var/tmp/portage/python-2.2.2/image//usr/lib/python2.2/compiler/ast.py^@^@^@__repr__<F4>^Bs^B^@^@^@^@^A(^G^@^@^@^@^@^@__name__s

What makes me think it's not related to hardware is that the data
changed to garbage under a running system.  No reboot (although the
garbage persists after a reboot) or unmount or anything.  I understand
bad memory could do this, but if the disk passes badblocks that makes me
wonder what went wrong.

Also, if files were replaced with garbage, how come no directories were
apparently corrupted?   When I ran reiserfsck, it reported no errors!
Any suggestions as to where I can go from here in tracking this down?

-- 
    -Matt Stegman

