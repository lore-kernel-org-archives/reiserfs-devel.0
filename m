From: Oleg Drokin <green@namesys.com>
Subject: Re: "no space left" but df -k shows plenty of free space
Date: Tue, 20 May 2003 13:44:52 +0400
Message-ID: <20030520094452.GA14828@namesys.com>
References: <23414.1053383082@www3.gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14176-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <23414.1053383082@www3.gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: D_i_F_i@gmx.de
Cc: mason@suse.com, reiserfs-list@namesys.com

Hello!

On Tue, May 20, 2003 at 12:24:42AM +0200, D_i_F_i@gmx.de wrote:
> >> Now we can use the filesystem without problems but I fear that we
> >> will run into problems when the filesystem reaches 77% usage again.
> >Hm, it will be interesting if you try.
> >May be it will stop working when there is 2498072 blocks left again.
> Sorry, but I can?t fill up the filesystem until it?s full because we
> need the filesystem for our daily work. If I realy should try this, I 
> have to wait until the next weekend. Also I have to ask several collegues,
> if it?s ok if I?m going to do this test at the next weekend. But if you
> think, this test will bring us a step further, I will try to get an "OK"
> for this test.

Please try.
Alternatively if you can create another reiserfs filesystem that would not be in use
by anyone and try to fill it and see how soon it will report "out of space",
that should be sufficient too.

> > Could you please run debugreiserfs -p /dev/xxx | gzip -c >
> > df-error-fs.gz, and make it available somewhere for us to download.  If
> > you are using reiserfsprogs 3.x.0j or so the output can contain actual
> > file data, so you probably want to put the image onto a password
> > protected page.
> > This will take a metadata dump of the filesystem, I'd like to check it.
> I guess, I can execute this command while the filesystem is mounted and
> in use. Is this correct? Also I?ve to check first, if there will be any

Yes, you can.

> "confidential" data in the output of the debug-command, which I?m not
> allowed to distribute. And as the command causes some system load, I may 
> have to wait until the next weekend, to generate this data.

This is ok.

> After I?ve got clearance for all these questions I would send you an
> approriate message.

Ok, thank you.

Bye,
    Oleg
