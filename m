From: Tom Vier <tmv@comcast.net>
Subject: Re: filenames that can be safely stolen (was Re: starting with ".." could break stuff)
Date: Sun, 4 Apr 2004 20:06:45 -0400
Message-ID: <20040405000645.GB9905@zero>
References: <200404010546.i315kEvY019805@sirius.cs.pdx.edu> <20040402035617.GC2158@zero> <8765ciqr6v.fsf@uhoreg.ca> <20040402220250.GB4668@rahul.net> <406EFCE2.8000108@namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17697-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <406EFCE2.8000108@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Sat, Apr 03, 2004 at 10:05:22AM -0800, Hans Reiser wrote:
> i care more about people 20 years from now complaining that reiserfs is 
> ugly in its aesthetics than about unreal problems.
> 
> punctuation in method names is uglier than "metas"

maybe if you try to pronounce it, but imho, making "metas" a reserved name
is not a good idea and is very ugly. taking a somewhat common word (though
"meta" is probably more common than "metas") and reserving seems like a huge
wart to me. if you have to reserve an inband name, it should be one that,
while containing mostly a descriptive english word, doesn't trample regular
filenames (eg, more than one dot).

and finally, i hate the 's'. 8) for one thing, it might only contain only
one file.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
