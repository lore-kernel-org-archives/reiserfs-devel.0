From: Tom Vier <tmv@comcast.net>
Subject: starting with ".." could break stuff
Date: Thu, 1 Apr 2004 22:56:17 -0500
Message-ID: <20040402035617.GC2158@zero>
References: <200404010546.i315kEvY019805@sirius.cs.pdx.edu>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17661-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200404010546.i315kEvY019805@sirius.cs.pdx.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

i bet there's a few apps that, when trying to skip .., only check the first
two chars of the name. this may or may not be a problem.

i'm not clear about how the metadata and plugins work. if you write to
..meta/blah there has to be a plugin registered for that meta filename,
right? does it keep the data in there ("..meta/blah") in some portian of the
normal, linear file? or is ..meta/ the only way to get at it? err - are we
talking about files as dirs? i'm confused. 8) i need some sleep.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
