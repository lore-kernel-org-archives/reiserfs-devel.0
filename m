From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: plagiarism of reiserfs by Debian
Date: Sun, 20 Apr 2003 08:17:22 +0200
Message-ID: <3EA23B72.9020606@netscape.net>
References: <20030419230654.GF26352@cheney.cx> <F592E162-72C9-11D7-ADF3-00050285B655@ncpro.com> <20030420034150.GP32700@zewt.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010202040703060802080906"
Return-path: <reiserfs-list-return-13735-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list <reiserfs-list@namesys.com>

--------------010202040703060802080906
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

On 04/20/2003 05:41 AM, Glenn Maynard wrote:
> Trimmed CC: little; I can't imagine why this should go to -testing ...
> 
> On Sun, Apr 20, 2003 at 02:49:36AM +0200, Marcel Weber wrote:
> 
>>All I can say to this is: use what you like, resp. if you don't like 
>>bloated software or spamware do not use it. My point is, that it should 
>>be a right of the original authors of the software to include credits. 
>>If someone else does a complete rewrite of the software, okay than we 
>>can discuss it, but if the rewrite means only the removal of the 
>>credits it is questionable.
> 
> 
> This is irrelevant.  We're not questioning whether Hans Reiser has the
> right to license his own software to prohibit the removal of large
> messages.  The questions being asked are:
> 
> 1. Is software licensed in the manner Hans intends DFSG-free?  That is,
> is it DFSG-free to require that interactive programs output a full
> page of sponsorship information?  (That's a question for debian-legal.)
> If not, it can not be distributed in Debian and will be relegated to
> non-free.
> 
> 2. Is the software licensed consistently?  If not, it's probably not
> legally safe to distribute at all, and will be removed entirely unless
> Hans clarifies the licensing.
> 
> Another question that comes to mind: has ReiserFS used code from projects
> licensed under the GPL?  If so, he can not, in fact, place this extra
> restriction, as it would be in violation of GPL clause 6.  This isn't a
> special issue for programs under completely different licenses; they know
> they're not GPL-compatible and don't use GPL code.  However, when people
> use "modified" GPL licenses, they often don't realise that they can no
> longer use code from other GPL projects.
> 
> 
>>But first of all, before we continue this discussion: What exactly has 
>>been removed? A readme file, the outputs during boot time, the outputs 
>>of mkfs.reiserfs? Has this output any impact on the usability of the 
>>software, so that there were good reasons the remove it? Has the 
>>license been violated by removing the credits?
> 
> 
> It's been suggested that the removed message is the one referenced in
> this bug report:
> 
>   http://bugs.debian.org/cgi-bin/bugreport.cgi?archive=no&bug=152547
> 
> Impact and "good reasons" don't matter.  Debian requires that users be
> granted the right to do certain things regardless of whether they have
> "good reasons".  If Hans doesn't want to grant those rights to users,
> that's may be his choice, but Debian won't distribute his software.
> 

I find this discussion quite annoying. I thought war is over now?! This 
discussion seems to come up every year now.


Can someone finally clearify why mkreiserfs _must_ advertise?


I use mkreiserfs from namesys ftp. And I use it every month running a 
script within a Konsole that I later search for errors. I know the 
mkreiserfs message by mind now. And I cut the unneeded lines 
(advertising ones) always while pasting the important lines of output to 
the logs. This would be simplified by a small patch not violating 
previous content nor function...

" ...Do You aggree with the Terms & Conditions before installation... 
YES/No (Don't forget to type YES each time for sponsor A, B & C)."
I don't want that kind of "progression" in any reiserfsprog!


Happy holidays and some wunderful sunny days,

Manuel

--------------010202040703060802080906
Content-Type: text/plain;
 name="patch.mkreiserfs.extra-short.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch.mkreiserfs.extra-short.diff"

diff -urN shared/SPECIAL_THANKS shared.c/SPECIAL_THANKS
--- shared/SPECIAL_THANKS   Thu Jan  1 01:00:00 1970
+++ shared.c/SPECIAL_THANKS Sun Apr 20 07:00:43 2003
@@ -0,0 +1,28 @@
+ SPECIAL SPONSORING
+====================
+
+The Defense Advanced Research Projects Agency (DARPA) is the primary sponsor of
+Reiser4. DARPA does not endorse this project; it merely sponsors it.
+
+Continuing core development of version 3 is mostly paid for by Hans Reiser from
+money made selling licenses in addition to the GPL to companies who don't want
+it known that they use ReiserFS as a foundation for their proprietary product.
+And my lawyer asked 'People pay you money for this?'.  Yup.  Hee Hee.  Life is
+good.  If you buy ReiserFS, you can focus on your value add rather than
+reinventing an entire FS.  You should buy some free software too....
+
+SuSE pays for continuing work on journaling for version 3, and paid for much of
+the previous version 3 work.  Reiserfs integration in their distro is
+nconsistently solid.
+
+MP3.com paid for initial journaling development.
+
+Bigstorage.com contributes to our general fund every month, and has done so for
+quite a long time.
+
+Thanks to all of those sponsors, including the secret ones.  Without you, Hans
+would still have that day job, and the merry band of hackers would be missing
+quite a few....
+
+Have fun !!!
+
diff -urN shared/mkreiserfs/mkreiserfs.c shared.c/mkreiserfs/mkreiserfs.c
--- shared/mkreiserfs/mkreiserfs.c  Tue Mar 25 11:50:37 2003
+++ shared.c/mkreiserfs/mkreiserfs.c    Sun Apr 20 07:55:46 2003
@@ -714,30 +714,9 @@
  
    if (DEBUG_MODE)
        return 0;
-   printf ("\nThe Defense Advanced Research Projects Agency (DARPA) is the primary sponsor of"
-           "\nReiser4. DARPA does not endorse this project; it merely sponsors it."
-           "\n"
-           "\nContinuing core development of version 3 is mostly paid for by Hans Reiser from"
-           "\nmoney made selling licenses in addition to the GPL to companies who don't want"
-           "\nit known that they use ReiserFS as a foundation for their proprietary product."
-           "\nAnd my lawyer asked 'People pay you money for this?'.  Yup.  Hee Hee.  Life is"
-           "\ngood.  If you buy ReiserFS, you can focus on your value add rather than"
-           "\nreinventing an entire FS.  You should buy some free software too...."
-           "\n"
-           "\nSuSE pays for continuing work on journaling for version 3, and paid for much of"
-           "\nthe previous version 3 work.  Reiserfs integration in their distro is"
-           "\nconsistently solid."
-           "\n"
-           "\nMP3.com paid for initial journaling development."
-           "\n"
-           "\nBigstorage.com contributes to our general fund every month, and has done so for"
-           "\nquite a long time."
-           "\n"
-           "\nThanks to all of those sponsors, including the secret ones.  Without you, Hans"
-           "\nwould still have that day job, and the merry band of hackers would be missing"
-           "\nquite a few...."
-           "\n"
-           "\nHave fun.\n"); 
+   printf ("\nSPECIAL_THANKS go to: DARPA, Hans Reiser, SuSE, MP3.com, Bigstorage.com and"
+       "\n>                     all the generous secret sponsors..."
+       "\nPlease, read SPECIAL_THANKS in the ReiserFS Documentation for further information!");
     return 0;
 }
 

--------------010202040703060802080906
Content-Type: text/plain;
 name="patch.mkreiserfs.short.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch.mkreiserfs.short.diff"

diff -urN shared/SPECIAL_THANKS shared.b/SPECIAL_THANKS
--- shared/SPECIAL_THANKS   Thu Jan  1 01:00:00 1970
+++ shared.b/SPECIAL_THANKS Sun Apr 20 07:00:43 2003
@@ -0,0 +1,28 @@
+ SPECIAL SPONSORING
+====================
+
+The Defense Advanced Research Projects Agency (DARPA) is the primary sponsor of
+Reiser4. DARPA does not endorse this project; it merely sponsors it.
+
+Continuing core development of version 3 is mostly paid for by Hans Reiser from
+money made selling licenses in addition to the GPL to companies who don't want
+it known that they use ReiserFS as a foundation for their proprietary product.
+And my lawyer asked 'People pay you money for this?'.  Yup.  Hee Hee.  Life is
+good.  If you buy ReiserFS, you can focus on your value add rather than
+reinventing an entire FS.  You should buy some free software too....
+
+SuSE pays for continuing work on journaling for version 3, and paid for much of
+the previous version 3 work.  Reiserfs integration in their distro is
+nconsistently solid.
+
+MP3.com paid for initial journaling development.
+
+Bigstorage.com contributes to our general fund every month, and has done so for
+quite a long time.
+
+Thanks to all of those sponsors, including the secret ones.  Without you, Hans
+would still have that day job, and the merry band of hackers would be missing
+quite a few....
+
+Have fun !!!
+
diff -urN shared/mkreiserfs/mkreiserfs.c shared.b/mkreiserfs/mkreiserfs.c
--- shared/mkreiserfs/mkreiserfs.c  Tue Mar 25 11:50:37 2003
+++ shared.b/mkreiserfs/mkreiserfs.c    Sun Apr 20 07:37:46 2003
@@ -714,30 +714,15 @@
  
    if (DEBUG_MODE)
        return 0;
-   printf ("\nThe Defense Advanced Research Projects Agency (DARPA) is the primary sponsor of"
-           "\nReiser4. DARPA does not endorse this project; it merely sponsors it."
-           "\n"
-           "\nContinuing core development of version 3 is mostly paid for by Hans Reiser from"
-           "\nmoney made selling licenses in addition to the GPL to companies who don't want"
-           "\nit known that they use ReiserFS as a foundation for their proprietary product."
-           "\nAnd my lawyer asked 'People pay you money for this?'.  Yup.  Hee Hee.  Life is"
-           "\ngood.  If you buy ReiserFS, you can focus on your value add rather than"
-           "\nreinventing an entire FS.  You should buy some free software too...."
-           "\n"
-           "\nSuSE pays for continuing work on journaling for version 3, and paid for much of"
-           "\nthe previous version 3 work.  Reiserfs integration in their distro is"
-           "\nconsistently solid."
-           "\n"
-           "\nMP3.com paid for initial journaling development."
-           "\n"
-           "\nBigstorage.com contributes to our general fund every month, and has done so for"
-           "\nquite a long time."
-           "\n"
-           "\nThanks to all of those sponsors, including the secret ones.  Without you, Hans"
-           "\nwould still have that day job, and the merry band of hackers would be missing"
-           "\nquite a few...."
-           "\n"
-           "\nHave fun.\n"); 
+   printf ("\nSPECIAL_THANKS go to:"
+       "\n* DARPA, primary sponsor of Reiser4"
+       "\n* Hans Reiser, selling licences in addition to the GPL for extended FS applications"
+       "\n* SuSE, for paying for initial work and further journaling development in v3"
+       "\n* MP3.com, for initial journaling development"
+       "\n* Bigstorage.com, for gerneral and continous funding!"
+       "\n> great thanks remain to all the generous secret sponsors..."
+       "\n"
+       "\nPlease, read SPECIAL_THANKS in the ReiserFS Documentation for further information!");
     return 0;
 }
 

--------------010202040703060802080906--
