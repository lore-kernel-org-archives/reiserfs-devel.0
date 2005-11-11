From: John Gilmore <jgilmore@glycou.com>
Subject: Slowdown is gone & apt-get works with updated reiser4. So nevermind...
Date: Fri, 11 Nov 2005 13:59:39 +0000
Message-ID: <200511111359.39715.jgilmore@glycou.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26867-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I grabbed the reiser4 patch for 2.6.14-rc5 and compiled it. Thanks to 

Vladimir V. Saveliev's comments about

EXPORT_SYMBOL(clear_page_dirty_for_io);

in mm/page-writeback.c, I was able to get it working as a module, and it seems 
to have taken care of it.

I would have waited for the official 2.6.14-mm1 reiser patch before upgrading 
to 2.6.14, but CD burning didn't work with 2.6.12.


<rant>
There is, btw, one main reason that I've decided that whatever trouble it may 
cause, and whatever growing pangs I may experience along the way, root 
reiser4 is worth it. Does anybody remember GoBack? It was a versioning system 
for windows 95/98 that was incredibly flexible and useful. Tracked all 
changes to the whole disk. Old versions of a file? no problem. grab an old 
version of a directory for referance temporarily? easy. Got a virus? revert 
the whole HD, and then grab the newer copies of your documents and saved 
games as needed.

Microsoft includes an almost useless version of the same ability with their 
"system restore" facility on XP, but I've never seen or heard of anybody 
using it. And rightfully so, it majorly stinks. It doesn't track all files, 
it's interface is opaque, the fact that it even exists is hidden seven layers 
deep, you can't control which files are restored, you can't list previous 
versions of a file, you can't copy an old version of a subdirectory and it's 
contents out without wiping the new version. You can bet that in 10 years or 
so, Microsoft will come out with a version of system restore that doesn't 
suck though. Integrated into the file manager, right click access, and 
everything else too.

Goback is the only thing that I missed when I switched over to linux, and 
reiser4 is the only thing I've found that even hints at a similar ability. 
Even if it takes another 10 years to reach the same point of usability that 
GoBack had, it'll be well worth it.

And when that day comes, I won't even have to reformat (you didn't have to 
reformat to install GoBack, either.) It's been 10 years or so since my last 
format (Hrmm... a little over eight, actually) and I figured that as long as 
my HD was trashed (another reason to love reiser4 - any fs that has a 
standard tool that commonly trashes file systems beyond any hope of 
recovery... darn fsck.ext3) I might as well prepare for the future, and get 
better performance while I'm at it.

Note though, that features are definitely the first thing for me, performance 
is nice but not something that I'll notice too much, and I'd definitely be 
willing to sacrifice some to get enhanced semantics or versioning. Compiles 
take forever no matter what you do, and as long as the little things (like 
starting vim) don't take longer than a second or two, that's good enough.

</rant>
