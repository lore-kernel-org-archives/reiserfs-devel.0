From: Hans Reiser <reiser@namesys.com>
Subject: List of things requested by lkml for reiser4 inclusion (to review)
Date: Fri, 09 Sep 2005 10:36:06 -0700
Message-ID: <4321C806.60404@namesys.com>
References: <200509091817.39726.zam@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25907-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509091817.39726.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

We haven't been sending much email out, but we have been working away.=20
We just finished the VFS work, and will send a patch out on Monday. =20
akpm asked for a bullet list of things suggested on lkml as issues for
inclusion.=20

There are some things that I would like akpm to confirm represent the
official opinion/consensus as opposed to just someone posting an opinion
and perhaps not being right.  I assure you that all points made by
commenters were considered carefully, and I thank all of them for their
time.

If we lose every remaining point of this list, we can generate a patch
in a few days, because the VFS work was the only substantive (in coding
hours) task, and it is done.  Do I remember right that the submission
deadline is a week from Monday for 2.6.14 inclusion?

This is supposed to be a bullet list, so I don't list here the line by
line minor code improvements sent to us, most of which were
incorporated, but let me take a moment to thanks those who donated them.

Hans

1. pseudo files or "...." files

   disabled.  It remains a point of (extraordinary) contention as to whet=
her it can be fixed, we want to keep the code around until we can devote =
proper resources into proving it can be (or until we fail to prove it can=
 be and remove it).  We don't want to delay the rest of the code for that=
 proof, but we still think it can be done (by several different ways of w=
hich we need to select one and make it work.)  Let us postpone contention=
 on this until the existence of a patch that cannot crash makes contentio=
n purposeful, shall we?


2. dependency on 4k stack turned off

   removed as requested

3. remove conditional variable code, use wait queues instead.

   not done.  There are times when reduced functionality aids debugging. =
 kcond is (literally) textbook code.
   We don't care enough to fight much for it, but akpm, what is your opin=
ion?  Will remove if akpm asks us to.

4. remove reiser4_drop_inode

   done.

5. remove undesired abstraction layer right below reiser4 VFS hooks.

   done.  This was a big job just completed. =20

6. remove type safe lists and type safe hash queues.

   not done, it is not clear that the person asking for this represents a=
 unified consensus of lkml.  Other persons instead asked that it just be =
moved out of reiser4 code into the generic kernel code, which implies the=
y did not object to it.  There are many who like being type safe.  Akpm, =
what do you yourself think?

7. remove fs/reiser4/lib.h:/div64_32.

   is being replaced by the linux one.

8.  Remove all assertions because they clutter the code and make it hard =
to read

    We think this person was not an experienced security specialist, and =
that what we do is considered by professional code auditors to be laudabl=
e practice.  We can supply an emacs macro that makes them greyed out.  I =
myself found the assertions to be distracting at first (though functional=
 and especially necessary for a DARPA funded project), and then after tim=
e got used to them, and now I understand that it was just my inexperience=
 that caused the discomfort.  I now have a more sophisticated subconsciou=
s that is not discomforted or distracted by them.  People debugging find =
them very useful.  Defense branches tear their hair out at how difficult =
it is to get the commercial software they use coded this way, and I think=
 they are right to be frustrated.  Linux kernel folks, those DoD guys act=
ually know quite a few things about security, maybe its ok that they taug=
ht me something and the code reflects that?  We will conform on this if r=
equested to by akpm, but somehow I doubt he will quite honestly.  akpm?





