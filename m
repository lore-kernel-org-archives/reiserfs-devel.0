From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: reiserfs3 and -o sync revisited
Date: Tue, 19 Nov 2002 17:34:19 +0100
Message-ID: <m3heedjz78.fsf@merlin.emma.line.org>
References: <m3ptt7m6qq.fsf@merlin.emma.line.org>
	<20021118111011.C3827@namesys.com> <1037628696.3392.4.camel@tiny>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12032-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1037628696.3392.4.camel@tiny> (Chris Mason's message of "18
 Nov 2002 09:11:36 -0500")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Chris Mason <mason@suse.com> writes:

> -o sync needs a little help from the filesystem, and my patches don't
> add it.  Since we support fsync(file) after rename triggering a commit
> on the rename, we don't really need -o sync.
>
> But yes, I did fix my O_SYNC/fsync bug in the early versions of the data
> logging patches ;-)

So reiserfs ignores -o sync without complaining it's unimplemented. No
wonder reiserfs has an "eats-your-data" reputation.

NB: I find this inacceptable. Either have it reject chattr +S and mount
-o sync or fix it. But do not pretend it would be working when in fact
it's broken.

If this bug be unfixed by the end of the month, I'll have to convert any
r/w reiserfs systems left over to ext3fs.

The Linux file system semantics issue that has been going on for years
now is simply embarassing and awkward, be it the "dirasync" behaviour on
ext[23] or this ignoring -o sync. Linux needs to grow up. Seriously. And
quick.


I had also hoped that -o dirsync for ext2/ext3 would make it for 2.4.20,
but looking at Marcelo's BK tree, it hasn't. :-(

-- 
Matthias Andree
