From: "Perry Kundert" <perry.kundert@gmail.com>
Subject: Re: reiserfs performance on ssd
Date: Fri, 28 Apr 2006 11:37:40 -0600
Message-ID: <2f9ccaae0604281037n7d0cf95dx19859da492d5359e@mail.gmail.com>
References: <20060427151655.8b771812.pegasus@nerv.eu.org>
	 <20060427134702.GA8202@favonius>
	 <e692861c0604270728p2aa4a4e0i70d1ad43a3da2fcf@mail.gmail.com>
	 <BAYC1-PASMTP050C1EF12709BADAABFDBEBFBD0@CEZ.ICE>
	 <e692861c0604271025t8b60d9cn9aa47d68de55df5a@mail.gmail.com>
	 <op.s8ph2jz5cigqcu@apollo13>
	 <20060428082002.GG6075@schatzie.adilger.int>
Reply-To: perry@kundert.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28546-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060428082002.GG6075@schatzie.adilger.int>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: PFC <lists@peufeu.com>, reiserfs-list@namesys.com

On 4/28/06, Andreas Dilger <adilger@clusterfs.com> wrote:
> On Apr 28, 2006  09:07 +0200, PFC wrote:
> >       While I like the idea, the iram implementation is horrible for
> >       various  reasons :
> >
> >       - no ECC
>
> I don't know why people are so keen on ECC RAM.  Why not just put an extr=
a
> socket on the board and run the RAM in "RAIM" (RAID for Memory) mode?
> The incremental cost of ECC vs. regular RAM is FAR more than the cost
> of just getting the extra stick of RAM.  Also, with RAIM you could even
> hot-swap a failing DIMM, while with ECC you have to take an outage to
> get back to redundancy.
>
    RAID on disks only detects errors when the underlying device
reports them.  Things like corruption "on the wire" (eg. bad cables)
are NOT detected.

    Similarly, no matter how many redundant sticks of RAM you have,
you MUST HAVE some hardware, somewhere, doing some computation on all
the bits flowing by -- even something as simple as a "best 2 of 3"
comparison -- to enable you to detect bad bits, and lock out and/or
refresh the bad DIMM.



--
    -pjk
