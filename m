From: Felix Finch <felix@crowfix.com>
Subject: Reiserfs munched directory on power failure
Date: Sun, 15 Aug 2004 23:52:19 -0700
Message-ID: <16672.22947.218114.492596@crowfix.com>
Return-path: <reiserfs-list-return-20318-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I am running Linux 2.4.26 SMP with reiserfsprogs 3.6.4.  It is a dual
Athlon with 1G of RAM.  I have had losses three times in reiserfs
partitions when it loses power.  My mostly static partitions are ext3,
all others are reiserfs.  This is Slackware 9.0.

This poor machine is not behaving very well.  I added two disks to it,
the power supply called it quits and apparently left some lingering
resentment with the motherboard, maybe the processors, and now it
shuts itself off for no reason every once in a while.  Sometimes it
runs for a couple of minutes, other times for several days.  Not heat
related, I think, because I wait for the disks to spin down, hit the
power button, and it comes right back up.  It has failed on cold
mornings and hot afternoons.  The only common denominator is that it
has only failed when I am at the keyboard; I have never found it
turned off when I wake up, or when I come home.

I am awaiting parts to build a new machine.  Bummer!  Neato! :-)

I tell you all this in case you decide it makes this bug report
unreliable.  I am not certain of that, myself, because other than
losing unsaved edits, the only other problems are from the Reiserfs
partitions.

I have had three reiserfs failures.

One power failure occurred within a few seconds of opening a text file
in emacs.  I do not remember if I had made any changes, but if I
remember emacs correctly, it doesn't do anything with the original
file until you tell it to save.  At any rate, soon after opening the
file, power went bye-bye, and when I brought it back up, that file's
2000 lines of Perl code had been replaced by about half the GPL.
Luckily subversion had the original, so I did not lose anything.  No
other files were damaged that I could tell.

The other two were similar to each other, an hour or two apart.  I had
just visited a site with mozilla when power failed.  When it came back
up, and I restarted the browser, it had lost all my bookmarks and some
of my preferences.  I regret that I cannot say with detail what files
had gone walkabout, since I did not notice the corruption until I
brought mozilla up, and mozilla had (re)written new files by the time
I noticed.  I recovered everything from backup, and it hasn't lost
power while surfing the web since.

Mozilla does have LAST VISIT times in the bookmarks file, so it may
well have been modifying the file when power failed.  I don't know
what it would have been changing in the preferences file.

I don't have any idea why the Perl code was replaced by the GPL, since
I haven't done anything to the GPL file since I first vreated it many
moons ago, and I had not written any changes to the file.

The mozilla surprise was spookier, in some ways, but also more
understandable if mozilla had just written new versions and the
reiserfs journal is metadata only.

Once I get the new machine built and it has replaced the old machine,
I would be glad to help debug this, if it would help.  Installing a
new 2.4 kernel is no problem, but 2.6 is perhaps too much hassle; I
believe I would have to upgrade some utilities also.  But I can
certainly turn on extra logging, edit in extra logging, cycle power at
interesting times, etc.

And of course if these "failures" are just symptomatic of metadata
journaling and power failures, and you think they are all explainable
by natural causes, that's fine too.

I don't read this list, so cc: me if you want.

-- 
            ... _._. ._ ._. . _._. ._. ___ .__ ._. . .__. ._ .. ._.
     Felix Finch: scarecrow repairman & rocket surgeon / felix@crowfix.com
  GPG = E987 4493 C860 246C 3B1E  6477 7838 76E9 182E 8151 ITAR license #4933
I've found a solution to Fermat's Last Theorem but I see I've run out of room o
