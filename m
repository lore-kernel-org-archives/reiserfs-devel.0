From: Oleg Drokin <green@namesys.com>
Subject: Re: [BK] ReiserFS file write bug fix for 2.4
Date: Thu, 12 Sep 2002 08:53:00 +0400
Message-ID: <20020912085300.A4625@namesys.com>
References: <3D7F7783.6030804@namesys.com> <200209111934.11373.Dieter.Nuetzel@hamburg.de> <20020911215310.A1504@namesys.com> <200209112137.22422.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11430-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200209112137.22422.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: Linux Kernel List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Wed, Sep 11, 2002 at 09:37:22PM +0200, Dieter N?tzel wrote:
> > On Wed, Sep 11, 2002 at 07:34:11PM +0200, Dieter N?tzel wrote:
> > > On Wednesday 11 September 2002 19:04, Hans Reiser wrote:
> > > > Well, at least getting the new file write code into pre6 found this bug
> > > > for us....  please apply.
> > > What is the "right" way to get the new block allocation going?
> > use 2.4.19-pre2+ and it is in there ;)
> You meant 2.4.20-pre2, didn't you?

Ah, yes. 2.4.20-pre2+ of course.

Bye,
    Oleg
