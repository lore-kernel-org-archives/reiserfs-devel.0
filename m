From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: On a free repacker
Date: Tue, 25 May 2004 10:51:39 +0300
Message-ID: <20040525075139.GE4990@nysv.org>
References: <20040519192831.GL24604@nysv.org> <200405201028.13184.reiser@namesys.com> <20040520184054.GR24604@nysv.org> <40AEBBA0.6060606@namesys.com> <20040521184451.GS24604@nysv.org> <200405211902.i4LJ25RI016978@turing-police.cc.vt.edu> <20040524203016.GA4990@nysv.org> <40B25DF0.2090400@gmx.net> <20040524204751.GC4990@nysv.org> <40B267B4.6060002@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18839-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40B267B4.6060002@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2004@gmx.net>
Cc: Valdis.Kletnieks@vt.edu, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On Mon, May 24, 2004 at 11:23:00PM +0200, Carl-Daniel Hailfinger wrote:

>To get a local copy of a repository not yet on your disk:
>user@linux:~> bk clone bk://some.url/of/the/project
>and you have a directory "project" containing all the files you need.

svn co svn://host/repository/project

>To get the latest revision from the upstream repository, just issue
>user@linux:~> bk pull
>inside the project directory and your sources will be updated to the
>latest version available upstream.

co checkouts everything, svn update updates

>That was not a script. It was a collection of the most needed commands if

It looked a bit like the script I posted the url for here :)

>you want to follow a development tree. And it is definitely not python.

Hmm! Everything should be python ;)

>I now have tried to make the above more clear. Better?

Yeah

>> but I think it's useless. SVN is just svn update and there you have it.
>Wait. If I do not have the repository on my disk, svn update will get me
>the whole repository fully checked out?

I expressed myself badly, sorry.
Of course one has to make an initial checkout to get all the .svn
directories and all...

>That depends. I do not know what svn diff does. Assuming it takes file
>revision numbers, the following command in bk will work:
>bk diffs -r1.45..1.46

Ok, that's fairly equal.

>If you want a diff of two different tree revisions against each other:
>bk export -tpatch -r1.45,1.46

I think, but I can't check it now, svn supports recursive diffs by
default. svn diff -r 100:HEAD dev/ stable/ where dev and stable
are svn copied trees.

>> SVN's bigger problem seems to be that files are actually copied when
>> they're tagged. I love that, but I could see it flooding the hard drive.
>That is a cool feature.

It truly is. Tagging a new stable release is like this:
svn cp stable stable-1.1
svn ci

>Hey, everything is better than CVS. It was so complicated that after
>having tried it (and having invested days into learning it properly), I

I tried investing days into it, but I just broke the repositories :)

>You're right about the need. Time can be spent better than learning yet
>another revision control system.

Sure. Like working code that goes into the revision control system ;)

-- 
mjt

