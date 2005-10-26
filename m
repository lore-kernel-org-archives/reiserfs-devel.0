From: "Chester R. Hosey" <chosey@nauticom.net>
Subject: Re: Our introduction to Reiser-list
Date: Wed, 26 Oct 2005 12:43:29 -0400
Message-ID: <435FB231.5070507@nauticom.net>
References: <200510251558.13860.pvh@uvic.ca> <87k6g1yp5a.fsf@evinrude.uhoreg.ca> <435F7A2A.5020506@st-andrews.ac.uk> <200510260910.12136.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26661-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510260910.12136.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Peter van Hardenberg wrote:
> Although I freely acknowledge my inexperience, I believe the real problems are 
> related to graph traversal algorithms. Linus has commented on the obvious 
> hardlink issues. I imagine there are more gremlins lurking in the shadows on 
> this one. Garbage collectors have largely given up on reference counting, a 
> luxury afforded by blazingly fast access to small amounts of storage. I am 
> not particularly up on the research though.

Just a suggestion from the uninformed peanut gallery...

Hans already plans on having a repacker, which will run incrementally in
the background. Might it make sense to do incremental GC, possibly even
in combination with the repacker's traversal of the disk?

Chet

