From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [Bug 3.4.5] reiserfs: mutex_destroy called with locked mutex
Date: Thu, 19 Jul 2012 05:28:24 +0100
Message-ID: <20120719042824.GW31729@ZenIV.linux.org.uk>
References: <5006491D.8070004@t-online.de>
 <CA+55aFzv5mntf6y9e_r5=v+beG19xBv67EpA=dP0-Zw1CQrGGg@mail.gmail.com>
 <20120718212044.GU31729@ZenIV.linux.org.uk>
 <CA+55aFyHpgbJ9Pn5xn_ALkvzjQBOWog2qLbwwtrKbPHSGpa6pA@mail.gmail.com>
 <20120718213355.GV31729@ZenIV.linux.org.uk>
 <CA+55aFx_soQ2sKAcY0yhSFOchkjH55Kvu=jTUW0PJLNxRk9rGQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+55aFx_soQ2sKAcY0yhSFOchkjH55Kvu=jTUW0PJLNxRk9rGQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Knut Petersen <Knut_Petersen@t-online.de>, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Wed, Jul 18, 2012 at 03:37:52PM -0700, Linus Torvalds wrote:
> On Wed, Jul 18, 2012 at 2:33 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> >  The only questions
> > are "is this the WARN_ON() Knut had stepped on" (and I agree with your
> > scenario now) and "is it critical enough to shove it into the tree
> > less than a week before -final".  Up to you...
> 
> 
> I agree that it isn't critical. Even the lockdep thing is just a
> warning, and is apparently quite hard to trigger.
> 
> Will you hold on to the patch in your VFS tree, and we can just merge
> it for 3.6?

Sure, no problem...
