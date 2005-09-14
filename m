From: Bruce Israel <israel@tux.org>
Subject: Re: Interview with Hans on KernelTrap
Date: Wed, 14 Sep 2005 10:59:43 -0400
Message-ID: <20050914145943.GA10380@home.exsolent.com>
References: <878xy0sy0d.fsf@evinrude.uhoreg.ca> <432820E8.9080201@st-andrews.ac.uk> <43282F89.4020907@darthvader.us>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25955-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <43282F89.4020907@darthvader.us>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yiannis Mavroukakis <jander@darthvader.us>
Cc: reiserfs-list@namesys.com

On Wed, Sep 14, 2005 at 03:11:21PM +0100, Yiannis Mavroukakis wrote:
> Peter Foldiak wrote:
> 
> >Hans, in the interview you give the example:
> >
> > cat /home/reiser/mp3s/..../childcat > /dev/dsp
> >
> >to illustrate concatenation.
> >[...]
> > 
> >The convention (I think also approved(suggested?) by Linus at some 
> >point) could be that where you say
> >
> > /home/reiser/mp3s
> >
> >you get a the file (or concatenation, if the directory has no "file" 
> >content itself), but when you say
> >
> > /home/reiser/mp3s/
> >
> >(with the trailing "/"), you get the directory.
> >
> If cool is the first perceived benefit, then why do it ? Besides, it's 
> quite easy through force of habit or mistype to add a '/'

Plus often shell completions (e.g. TAB in bash) often add the
trailing slash automatically.  Though there's an argument to be made
for that being what you want; i.e. how often do you really do a 'cat
<dir>' to look at the inside of the directory?  Though I guess if I
were doing a 'chown -R <user> <directory>', I'd be miffed if it just
changed the files below and not the directory because of a mis-typed
(or mis-completed) slash.

Bruce
