From: "Nicholas S. Wourms" <nwourms@netscape.net>
Subject: Re: Reiser4's status of this week.
Date: Sat, 19 Jun 2004 19:27:24 -0400
Message-ID: <40D4CBDC.7070208@netscape.net>
References: <7794555.1087651158684.JavaMail.postfix@mx20.mail.sohu.com> <40D45B6C.7000002@namesys.com> <40D482CB.1080303@netscape.net> <20040619220830.GK4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19277-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040619220830.GK4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mjt@nysv.org
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

> On Sat, Jun 19, 2004 at 02:15:39PM -0400, Nicholas S. Wourms wrote:
> 
>>I've also noticed, as has been noted in the past, that bk pulls are 
>>still broken.  Someone mentioned that it is a problem with the new bk. 
>>If this is true, why not contact Larry for support?  Not that it matters 
>>now, since the reiser4-linux-2.6 isn't usable, but it might be helpful 
>>for future syncs.
> 
> 
> The new 2.6s are very usable.

I wasn't referring to the actual state of the kernel with the reiser4 
patches.  I was talking about the BK repo, which is *exactly* the same 
as a stock 2.6.5 with an -mm patch (in other words it has none of the 
reiser4 infrastructure patches applied, like it should have).  This is 
contrary to what the namesys webpage says ought to be in there and is 
contrary with the way it had been in the past.

> Last I spoke with Zam Zarochentsev he said he had a theory for fixing
> the biggest bug that has to do with mmap applications when running out
> of memory.
> 
> Besides that, I haven't heard of any mission-critical bugs.
> 
> As for BK, I don't care, as we have the auto-snapshots at the URL
> http://namesys.com/auto-snapshots available.

How you feel about BK is not relevant, I wasn't addressing this concern 
to you.  Yes, I am aware of those snaps, but that defeats the purpose of 
bitkeeper, since you loose all the metadata and the simplicity of 
merging in code.

Also, those snapshot patches omit (I think) all of the excellent 
"extras", like UML improvements, which Hans has done.  My point is that 
the reiser4-linux-2.6 BK repo used to have everything except the actual 
fs/reiser4/* when it was called "reiser4-linux-2.5", but now it doesn't. 
  There have been problems with the synching of the namesys public repos 
with the private repos in the past, so I thought this might be what is 
happening now to reiser4-linux-2.6.

Cheers,
Nicholas

