From: Dan Oglesby <doglesby@teleformix.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
	regarding reiser4 inclusion
Date: Mon, 31 Jul 2006 11:47:00 -0500
Message-ID: <1154364421.7964.22.camel@localhost>
References: <1153760245.5735.47.camel@ipso.snappymail.ca>
	 <200607241806.k6OI6uWY006324@laptop13.inf.utfsm.cl>
	 <20060731125846.aafa9c7c.reiser4@blinkenlights.ch>
	 <20060731144736.GA1389@merlin.emma.line.org>
	 <20060731175958.1626513b.reiser4@blinkenlights.ch>
	 <20060731162224.GJ31121@lug-owl.de>
Reply-To: doglesby@teleformix.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29301-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060731162224.GJ31121@lug-owl.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: Adrian Ulrich <reiser4@blinkenlights.ch>, Matthias Andree <matthias.andree@gmx.de>, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Mon, 2006-07-31 at 18:22 +0200, Jan-Benedict Glaw wrote:
> On Mon, 2006-07-31 17:59:58 +0200, Adrian Ulrich <reiser4@blinkenlights.ch> wrote:
> > A colleague of mine happened to create a ~300gb filesystem and started
> > to migrate Mailboxes (Maildir-style format = many small files (1-3kb))
> > to the new LUN. At about 70% the filesystem ran out of inodes; Not a
> 
> So preparation work wasn't done.
> 
> MfG, JBG
> 

I'd agree with that statement.  The wrong filesystem was chosen at the
beginning of the project.

As someone who is currently planning to migrate ~100GB of stored mail to
the Maildirs format, it was pretty clear early on that EXT3 would not
cut it (from past and current experiences), and not just for the sake of
calculating inodes.

--Dan

