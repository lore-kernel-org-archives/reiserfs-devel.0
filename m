From: Chris Dukes <pakrat@www.uk.linux.org>
Subject: Re: Is it good for a PDA fs?
Date: Sat, 22 Jun 2002 17:57:46 +0100
Sender: <pakrat@www.linux.org.uk>
Message-ID: <20020622175746.I13075@parcelfarce.linux.theplanet.co.uk>
References: <20020622115207.E23457@gerf.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10794-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020622115207.E23457@gerf.org>; from docwhat@gerf.org on Sat, Jun 22, 2002 at 11:52:07AM -0500
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: The Doctor What <docwhat@gerf.org>, reiserfs-list@namesys.com

On Sat, Jun 22, 2002 at 11:52:07AM -0500, The Doctor What wrote:
> Having just bought a Sharp Zaurus with a 64meg MMC and a 256 CF, my
> mind instantly jumps to the question, can it be used to pick up
> chicks?
> 
> When I was done with that avenue of thought, I wondered if it's
> worth it to figure out how to build my own kernel just to add
> reiserfs to it.
> 
> I know about it's handiness with journalling, etc. and that'd be
> useful for the occasional glitches I've had.
> 
> Does ReiserFS has anything that is more useful or less usefull for
> such a small memory application?

Standard journalling techniques just fry a portion of the compact flash
faster.  The tail merging might save space, but I would like to see
a study of its effects on the longevity of compact flash.

I think, but could be mistaken, than you want JFFS or JFFS2.

-- 
Chris Dukes
The Information Technology field is similar to a Marx Brothers sketch.
As a sysadmin, I fill in for Harpo Marx.  -- me.
