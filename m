From: Oleg Drokin <green@namesys.com>
Subject: Re: access beyond end of device again
Date: Wed, 26 Jun 2002 08:53:34 +0400
Message-ID: <20020626085334.A5175@namesys.com>
References: <661330051733.20020624103045@redefine.org> <20020625095409.A6209@namesys.com> <1141375583133.20020626230935@redefine.org> <20020625101503.A878@namesys.com> <0819468.20020627004746@redefine.org> <20020625115505.A2937@namesys.com> <712080311.20020627010847@redefine.org> <20020625121353.A3027@namesys.com> <353485111.20020627013212@redefine.org> <17757009865.20020625162242@redefine.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10847-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <17757009865.20020625162242@redefine.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin <coggy@redefine.org>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Jun 25, 2002 at 04:22:42PM -0700, Kevin wrote:
> You think moving the drive to a different controller (not hpt) would
> help?  I've got an extra channel on a promise ata66 card that I could
> use.

I am not sure, but it seems promise controllers have aven more problems
with VIA chipsets than HPT controllers.
But it is impossible to say until you try that combination and see what happens.

Bye,
    Oleg
