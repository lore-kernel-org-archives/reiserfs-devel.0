From: Oleg Drokin <green@namesys.com>
Subject: Re: access beyond end of device again
Date: Mon, 24 Jun 2002 18:48:44 +0400
Message-ID: <20020624184843.A896@namesys.com>
References: <1951319530634.20020624073524@redefine.org> <Pine.LNX.4.44.0206250034070.28871-100000@avon.timetraveller.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10817-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0206250034070.28871-100000@avon.timetraveller.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Brockway <robert@timetraveller.org>
Cc: Kevin <coggy@redefine.org>, reiserfs-list@namesys.com

Hello!

On Tue, Jun 25, 2002 at 12:37:02AM +1000, Robert Brockway wrote:
> > I'm getting these errors again:
> >   attempt to access beyond end of device
> >   38:01: rw=0, want=2052028788, limit=58633312
> What sort of device is this supposed to be? :)  38:01 is either a "Myricom 
> PCI Myrinet board" or something "reserved for Linux/AP+" (and I'm assuming 
> we're talking about a block device rather than a character device here :)

Numbers printed are in hex, so this is:
    block       Fifth IDE hard disk/CD-ROM interface
                  0 = /dev/hdi          Master: whole disk (or CD-ROM)
                 64 = /dev/hdj          Slave: whole disk (or CD-ROM)

                Partitions are handled the same way as for the first
                interface (see major number 3).

Bye,
    Oleg
