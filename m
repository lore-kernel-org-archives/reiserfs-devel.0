From: Oleg Drokin <green@namesys.com>
Subject: Re: Possible problem with Firewire device
Date: Mon, 19 Aug 2002 09:26:56 +0400
Message-ID: <20020819092656.A1874@namesys.com>
References: <Pine.LNX.4.44.0208171042410.10279-100000@avon.timetraveller.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11225-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0208171042410.10279-100000@avon.timetraveller.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Brockway <robert@timetraveller.org>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Aug 17, 2002 at 11:28:59AM +1000, Robert Brockway wrote:

> The tar should have come out at about 7.5Gb (no compression).  The tar
> seemed to be fine until it got to about 382Mb.  At this point the tar

Have anything appeared in the logs at this moment?
Can you lookup where this process blocks once you have some time?
(you can obtain list of where process aer waiting by pressing alt-sysrq-T
keys sequence assuming you have compiled-in sysrq support of course).

Thank you for the report.

Bye,
    Oleg
