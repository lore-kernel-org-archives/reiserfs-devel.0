From: "Dushan Tcholich" <dusanc@gmail.com>
Subject: Re: Reiser4 Netbeans 6 problems
Date: Thu, 28 Feb 2008 12:16:18 +0100
Message-ID: <a08621850802280316h41feae89ie505b09942dacdb3@mail.gmail.com>
References: <200802272135.41599.berny@mclink.it>
	 <200802280924.06538.berny@mclink.it>
	 <a08621850802280158j4d83ff0ap636fc8dea9de1747@mail.gmail.com>
	 <200802281211.10536.berny@mclink.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=ya6A3KZMxQ/0HjUQX4jK82mQGUiYvqQtVbqKNCeh7LQ=;
        b=t7bkajyOyumMSmCJmX134NEOcRVdCmlZRvpEjSU+Mt67O7C3Poh4lBOBmS59ga4uzrdrsffFT/Ki7pUizh8abWpkdOYMYnqagsLc8lDiyUZnaQMU75w8pSofCYJLWMvLnVZfaKCt2Bnmw/sOWMRykMc9vrf3DeXQE3+wSmF+W1k=
In-Reply-To: <200802281211.10536.berny@mclink.it>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?ISO-8859-1?Q?berny=AE?= <berny@mclink.it>
Cc: reiserfs-devel@vger.kernel.org

Then it's something else.
BTW, nodiratime is unnecessary when you use noatime, it's a subset of it.
I can't reproduce it, but I use GMOME :)
Try to time sync sometimes, and see what happens.

dusan@krshina3 ~ $ time sync

real    0m1.330s
user    0m0.000s
sys    0m0.005s

On Thu, Feb 28, 2008 at 12:11 PM, berny(R) <berny@mclink.it> wrote:
> Hi,  Dushan.
> I think that it was happening something like this.
> The overall imperssion that I had using the file system was of extremely fast
> moments with many lock intervals where the system was like frozen.
> May be is best to have some fancy options in fstab for mounting.
> But anyway I'm sure that noatime was on:
> reiser4                 defaults,noatime,nodiratime        0       0
>
> That was.
>
> Thanks, Paolo
>
>
>
>
> On Thursday 28 February 2008 10:58:42 you wrote:
> > It's not wrong.
> > I remember that there were stalls when fs was mounted without -noatime
> > option because there was a lot of atime updates that were batched.
> > This behaviour was fixed I think, but I asked you to see if it reappeared
> > again.
> >
> > Thanks
> > Dushan
> >
>
>
>
> > On Thu, Feb 28, 2008 at 9:24 AM, berny(R) <berny@mclink.it> wrote:
> > > On Thursday 28 February 2008 07:11:45 you wrote:
> > > > And about freezing, are you using -noatime mount option for your
> > > > reiser4 partition or not?
> > >
> > > Yes, I'm using noatime option for all partitions. Was there wrong?
> > >
> > > Paolo
> > >
> > > > On Wed, Feb 27, 2008 at 11:19 PM, Arend Freije <afreije@inn.nl> wrote:
> > > > > berny(R) wrote:
> > > > > > Hi, Edward.
> > > > > > Last week I reformat my Ubuntu 7.10 64bit system to try Reiser4
> > > > >
> > > > > filesystem
> > > > >
> > > > > > (actually I'm using reiserfs 3.6).
> > > > > > I put all my partition (even / and except boot) on reiser4 kernel
> > >
> > > was
> > >
> > > > > 2.6.24
> > > > >
> > > > > > compiled in the kernel.
> > > > > >
> > > > > > I got strange problems:
> > > > > > the first was with netbeans java IDE, when I was compiling in the
> > > > >
> > > > > window on
> > > > >
> > > > > > the bottom of the screen I got only garbage (like little square)
> > >
> > > like
> > >
> > > > > when
> > > > >
> > > > > > you have a different char set than the good one!
> > > > > > After that the java app was working but it was impossible to see
> > > > > > compile warnings or errors.
> > > > > >
> > > > > > The second thing that happened was that sometimes my kde 3 desktop
> > > > >
> > > > > became
> > > > >
> > > > > > frozen, for example, konqueror window open then click on the cross,
> > >
> > > the
> > >
> > > > > > system froze for 10 seconds then the window close and all was
> > > > > > normal
> > > > >
> > > > > again.
> > > > >
> > > > > > I formatted with standard options and also standard mount options
> > >
> > > for
> > >
> > > > > all the
> > > > >
> > > > > > drives and partition.
> > > > > >
> > > > > > My system is a striker extreme board, intel core 2 duo 2.4 4 gb
> > > > > > Kingston hiperX ram, 2 barracuda 500 Gb.
> > > > > >
> > > > > > Do you have some suggestions expecially about the java stuff?
> > > > > > Now I'm back to reiser 3.6 because I need to work with netbeans!
> > > > >
> > > > > Hi Paolo,
> > > > >
> > > > > Interesting that you see the squares in the Netbeans output window.
> > > > > I've seen them too but it didn't occur to me that it would be related
> > > > > to Reiser4. I'm running on a Gentoo box, Athlon XP 2400+,  kernel
> > > > > 2.6.22 with Reiser4 on all partitions, Netbeans 6 built from sources.
> > > > > I noticed that the squares appear initially but when the log grows
> > > > > (over a few KiB), the squares turn to normal characters. To force the
> > > > > log to grow, I changed the Ant verbosity to "verbose"
> > > > > (Tools/Options/Miscellaneous/Ant).
> > > > > Sometimes with a short log the blocks in the output window disappear
> > > > > when the compilation or XML transformation is repeated.
> > > > >
> > > > > Kind regards,
> > > > >
> > > > > Arend
> > > > >
> > > > >
> > > > >
> > > > >
> > > > > -
> > > > > To unsubscribe from this list: send the line "unsubscribe
> > >
> > > reiserfs-devel"
> > >
> > > > > in
> > > > > the body of a message to majordomo@vger.kernel.org
> > > > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
>
>
>
> --
> Mail To:
>  berny@mclink.it
>
> My Icq:95939684
> My yahoo:mailer227
> Aim:berny9944566
> Msn:fugazzi995@hotmail.com
>
> Home Page: http://www.ukbor.net
>
> "The day you decide that it is better to be a hypocrite and just do whatever
> everybody else is doing and not be different, you have died you have
> committed suicide."
>
> "If you can love, love! If you cannot love, forget this one, find somebody
>  else. But don't waste time! The question is not of this lover or that lover
>  the question is of love. Love fullfills, people are just excuses."
>
> "The moment you trust in let-go, the moment you stop struggling against
> existence, you need not worry about anything; existence takes care.But it
> takes care in its own way, not according to your desires, because if you have
> desires, demands, you are not trusting existence. Trust simply means that
> whatever is happening and is going to happen is perfectly right.
> Existence is wiser than any individual, because an individual has a small
> consciousness. Even if he is enlightened he is still just a dewdrop in this
> vast ocean of existence. And what existence feels is right.
> Existence cannot go wrong.
> If it does not fulfill our desires, that simply means our desires were wrong."
>
>
> (c)CopyRight 1998-2008 UKBOR Corp.(R)
>   All Right Reserved.
>
