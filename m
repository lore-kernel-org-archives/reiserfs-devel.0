From: Ross Vandegrift <ross@willow.seitz.com>
Subject: Re: Silly question, defrag
Date: Wed, 3 Apr 2002 15:30:39 -0500
Message-ID: <20020403203039.GA25023@willow.seitz.com>
References: <200204030017.12595@X-Message-Flag:> <3CAABBA6.3030101@swelltech.com> <200204030740.05950@X-Message-Flag:>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200204030740.05950@X-Message-Flag:>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Johnson <matthew@psychohorse.com>
Cc: reiserfs-list@namesys.com

On Wed, Apr 03, 2002 at 08:08:21AM -0800, Matthew Johnson wrote:
> On Wednesday 03 April 2002 00:21, Joe Cooper wrote:
> > "Don't"
> >
> 
> Well I don't, but when newbies who are used to computing on win32 systems 
> hear that they may not just accept the word don't. Actually its hard to find 
> the reasons exactly why one does not defrag.

Depending on the elevator algorithms in Linux (sorry, I'm not very
familiar with them), performance can actually be *increased* by
some bit of fragmentation.  If the data is spread out over the disk,
I've heard it allows some elevator algorithms to improve their queuing
stategies.  I'm pretty sure this is the case on Novell Netware.

Unfortunately I don't have enough technical knowledge about elevator
algorithms to really know if it helps or hurts us.  However, I do know
that back in the days when I was just getting into Linux stuff
(around 2.0.0-ish era), it was generally said that ext2 driver did basic
defrag on write and it limited fragmentation to pathological filesystem
usage.

Again, not sure that this is still the case.

Ross Vandegrift
ross@willow.seitz.com
