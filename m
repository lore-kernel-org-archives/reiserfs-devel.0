From: Shawn Rutledge <e_cloud@yahoo.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 10:59:52 -0700 (PDT)
Message-ID: <20040826175952.87529.qmail@web52806.mail.yahoo.com>
References: <1093480940.2748.35.camel@entropy>
Reply-To: e_cloud@yahoo.com
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20745-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093480940.2748.35.camel@entropy>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


--- Nicholas Miell <nmiell@gmail.com> wrote:
> Anything that currently stores a file's metadata in another file
> really
> wants this right now. Things like image thumbnails, document
> summaries,
> digital signatures, etc.

As well as cases where the metadata is currently _in_ the file, right? 
Like MP3ID tags, EXIF tags, etc.  And so many MP3 jukebox-server
programs currently use a database to store metadata, just because they
don't trust the MP3ID tags or need to store supplemental info.  Being
able to put this stuff in the filesystem along with the files would be
so much cleaner.  So I think there are plenty of uses for it.

IMO the Mac resource fork was always a good idea too, and I haven't a
clue why it got left out of OSX (maybe Woz "got it" but Jobs doesn't).

Somebody said "we don't have to teach tar about it"; does that mean
that tar in its present form would already successfully find the
alternate streams?


=====
. _______  Shawn T. Rutledge / KB7PWD ecloud@bigfoot.com
 (_  | |_)    http://ecloud.org/  kb7pwd@kb7pwd.ampr.org
 __) | | \______________________________________________
