From: Erik Terpstra <erik@solidcode.net>
Subject: Re: Can ReiserFS solve this?
Date: Mon, 28 Apr 2003 17:24:10 +0200
Message-ID: <3EAD479A.2070606@solidcode.net>
References: <3EAD34D5.8030108@solidcode.net> <3EAD406E.5040108@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13871-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EAD406E.5040108@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi Hans,

Hans Reiser wrote:

> Is there a test for completeness of the tiff?  It could be done as a 
> reiser4 plugin.

Yes, tiffinfo.c from libtiff (http://www.libtiff.org).
That would indeed be an elegant solution!

I just realized that the code in the fuser command could also be done as 
a reiser4 plugin (as to provide a more generic solution).
A fuser reiser4 plugin probably implies the following:

An 'ls' command on an input directory would indeed show only 
'transferred files', which I realize could better be described as 'files 
that are in-use by a process'.

So when such a plugin is active on my home directory and I do an ls I 
only see 'complete files'. However when one of my files is opened by a 
program, for example bla.doc is opened by OpenOffice, then bla.doc won't 
be visible in the results of the 'ls' command (which is kind of weird 
behaviour but could be handy at times).

Is my assumption correct? There is no further distinction between files 
that are being received and files that are in use by a process?

Erik.


