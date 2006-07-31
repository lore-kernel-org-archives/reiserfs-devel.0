From: David Masover <ninja@slaphack.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Mon, 31 Jul 2006 11:44:25 -0500
Message-ID: <44CE3369.8040704@slaphack.com>
References: <1153760245.5735.47.camel@ipso.snappymail.ca> <200607241806.k6OI6uWY006324@laptop13.inf.utfsm.cl> <20060731125846.aafa9c7c.reiser4@blinkenlights.ch> <20060731144736.GA1389@merlin.emma.line.org> <20060731175958.1626513b.reiser4@blinkenlights.ch> <20060731162224.GJ31121@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29299-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060731162224.GJ31121@lug-owl.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Adrian Ulrich <reiser4@blinkenlights.ch>, Matthias Andree <matthias.andree@gmx.de>, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Jan-Benedict Glaw wrote:
> On Mon, 2006-07-31 17:59:58 +0200, Adrian Ulrich <reiser4@blinkenlights.ch> wrote:
>> A colleague of mine happened to create a ~300gb filesystem and started
>> to migrate Mailboxes (Maildir-style format = many small files (1-3kb))
>> to the new LUN. At about 70% the filesystem ran out of inodes; Not a
> 
> So preparation work wasn't done.

So what?

Yes, you need to do preparation.  But it is really nice if the 
filesystem can do that work for you.

Let me put it this way -- You're back in college, and it's time to write 
a thesis.  You have a choice of software packages:



Package A:  You have to specify how many pages, and how many words, 
you're likely to use before you start typing.  Guess too high, and 
you'll print out a bunch of blank pages at the end.  Guess too low, and 
you'll run out of space and have to start over, copy and paste your 
document back in, and hope it gets all the formatting right, which it 
probably won't.

Package B:  Your document grows as you type.  When it's time to print, 
only the pages you've actually written something on -- but all of the 
pages you've actually written something on -- are printed.



All other things being equal, which would you choose?  Which one seems 
more modern?

Look, I understand the argument against ReiserFS v3 -- it has another 
limitation that you don't even know about.  That other limitation is 
scary -- that's like being able to type as many words as you want, but 
once you type enough pages (no way of knowing how many), pages start 
randomly disappearing from the middle of your document.

But the argument that no one cares about inode limits?  Really, stop 
kidding yourselves.  It's 2006.  The limits are starting to look 
ridiculous.  Just because they're workable doesn't mean we should have 
to live with them.
