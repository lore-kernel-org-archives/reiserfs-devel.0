From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: Re: EVMS Reiser FSIM
Date: Wed, 29 May 2002 11:28:38 -0500
Message-ID: <OF7550755B.8F3C611F-ON85256BC8.0056E5DC@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10436-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yury Umanets <umka@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>, Andrew Clausen <clausen@gnu.org>


Yury Umanets:
>Steve Pratt wrote:

>>Thanks for all the help answering questions about the reiser utilities.
I
>>have released the  ReiserFS FSIM into the EVMS CVS tree to be included in
>>our upcoming 1.1 release.   Check it out if you get a chance and feel
free
>>to give me comments.  Also let me know if you think more options are
>>required on mkfs and fsck.  I only did the basics and avoided
non-standard
>>journals since the kernel file system code is not readily available yet.
>>When it is, I can go back and add that support.
>>
>>
>I thing you have released an incorrect reiserfs FSIM in theory. On my
>own you should add extra parameters
>support into GNU Parted (quite simple task). And then you might be using
>it as central component of FSIM
>for *ALL* filesystems. Not just for reiserfs.

Actually I started with Parted months ago.  I released an FSIM based on the
parted ext2 and fat support (before the libreiser was added).  The problem
is that Parted is simply both inadequate and in my mind unstable.

Inadequate because it offers NO parameter passing to the file system code.
How would you ever specify and external journal location or a journal size,
Parted does not have the API support for this and I don't know when it
will.

Unstable because each of the file system utilities may or may not be a
re-implementation of the utilities written by the file system developers.
I know this to be true for the ext2 code in Parted, which has segfaulted on
me more than once while performing an expand.  I want to use the code
approved by the owners of the file system.

>Or you might be using some library (from reiserfsprogs package or from
>progsreiserfs package).

As I have stated previously, if the ReiserFS utilities package start
shipping this as part of their standard tool set, then I would consider
using it.  In fact if the file system community would come up with a
standard library interface I would be even happier.  Also, last I heard
from Andrew, this library did not contain fsck code (but maybe that has
changed).

>The way you have selected, might be used by an proprietary software,
>that wanted to use GPL project, not other GPL project.

What is your point?  This is a true statement, but was not the reason for
implementing the code this way.

>BTW, I have almost done smart resizing (from partition start) in
>libreiserfs. But you can't using the libraries of third pesons, so you
>will haven't smart resizing and other features in your FSIM :))

Do you mean moving the start of the partition?  Not really interested.  But
I am confused about your comment of not being able to use libraries of
third persons.  EVMS is GPL and could link to any GPL code it wants.  If
the libreiserfs is the *right* set of code to use, than I will use it.

>Yet another issue. One man almost done JFS support for GNU Parted. Are
>you going to add it to EVMS too? I think yes. And probably you will do
>it in maner like ReiserFS (forking and piping).

Already done.  And I have the added benefit of picking up fixes in
utilities whenever the file system developers make them.  Is this person
monitoring the JFS CVS tree to ensure that he does not miss an important
fix that might go into JFS?  Does he have the external journal support in
the library yet?  Oh wait, there is no way to pass parameters to filesystem
code in Parted, so he can't have support for it.


Thanks, for the input, but I had already considered all of these options
and decided that they were not in the best interest of the EVMS project.

Steve


