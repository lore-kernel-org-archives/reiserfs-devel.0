From: Tom Vier <tmv@comcast.net>
Subject: Re: Snapshots a la NetApp?
Date: Mon, 24 Mar 2003 19:03:02 -0500
Message-ID: <20030325000302.GB6118@zero>
References: <200303221822.34401.phma@webjockey.net>
 <33433.10.20.2.148.1048390681.squirrel@alpha>
 <1048411014.1427.5.camel@wusel.schnulli.de> <3E7F6F66.5050808@namesys.com>
 <1048542143.1332.31.camel@wusel.schnulli.de>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-13359-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <1048542143.1332.31.camel@wusel.schnulli.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

fwiw, there's pdumpfs, which does much the same thing. it's much like
plan9's dump (which writes snapshots to worm media). pdumpfs has worked
great for me. i just use it for my home directory. note that many programs
don't handle hardlinks well. specifically tar, cpio, and rsync (the last two
use TONS of memory even if you have just a few months worth of snapshots).

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0xE6CB97DA
