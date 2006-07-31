From: "Nate Diller" <nate.diller@gmail.com>
Subject: Re: Solaris ZFS on Linux [Was: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion]
Date: Mon, 31 Jul 2006 16:25:07 -0700
Message-ID: <5c49b0ed0607311625t62420736q8cad927bfaf2210c@mail.gmail.com>
References: <reiser4@blinkenlights.ch>
	 <20060731225734.ecf5eb4d.reiser4@blinkenlights.ch>
	 <200607312208.k6VM82P5012867@laptop13.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29349-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607312208.k6VM82P5012867@laptop13.inf.utfsm.cl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Horst H. von Brand" <vonbrand@inf.utfsm.cl>
Cc: Adrian Ulrich <reiser4@blinkenlights.ch>, matthias.andree@gmx.de, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On 7/31/06, Horst H. von Brand <vonbrand@inf.utfsm.cl> wrote:
> Adrian Ulrich <reiser4@blinkenlights.ch> wrote:
> > > > Great to see that Sun ships a state-of-the-art Filesystem with
> > > > Solaris... I think linux should do the same...
> > >
> > > This would be worthwhile, if only to be able to futz around in Solaris-made
> > > filesystems.
>
> > s/I think linux should do the same/I think linux should include Reiser4/
> >  ;-)
>
> So ZFS isn't "state-of-the-art"?

maybe reiser4 and ZFS are.  certainly, they optimize for different
behavior though

> [...]
>
> > But i'd rather like to see a Linux version of WAFL :-)
>
> WAFL is for high-turnover filesystems on RAID-5 (and assumes flash memory
> staging areas). Not your run-of-the-mill desktop...

yeah, good thing nobody tries to use linux for high-turnover servers
with RAID.  pish-posh.

> > ZFS didn't really impress me:
> > The Volume-Manager is nice but the Filesystem.. well: It beats UFS
> > .. sometimes ;-)
>
> OK, ext3 + LVM it is then.
>
> > See also: http://spam.workaround.ch/dull/postmark.txt
>
> Interesting.

yeah, i hadn't seen postmark numbers on linux before.  maybe mongo
isn't so biased after all

NATE
