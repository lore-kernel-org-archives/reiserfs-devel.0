From: Oleg Drokin <green@namesys.com>
Subject: Re: Re: [STUPID TESTCASE] ext3 htree vs. reiserfs on 2.5.40-mm1
Date: Mon, 7 Oct 2002 12:51:44 +0400
Message-ID: <20021007125144.A4967@namesys.com>
References: <200210042254.23978.Dieter.Nuetzel@hamburg.de> <20021004220126.GB3000@clusterfs.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11617-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021004220126.GB3000@clusterfs.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter =?koi8-r?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>, ReiserFS List <reiserfs-list@namesys.com>, Chris Mason <mason@suse.com>, Paul P Komkoff Jr <i@stingr.net>, Manuel Krause <manuel.krause@mb.tu-ilmenau.de>

Hello!
On Fri, Oct 04, 2002 at 04:01:26PM -0600, Andreas Dilger wrote:

> > Try with latest ReiserFS data-logging and see what we get?
> > Chris do you have something for 2.5.40+ ready?
> I don't think it will make much difference - the files being created
> are zero-length files so the journaling mode is irrelevant.

The mode is unerlevend indeed, but there are other fixes in hose pathces that
prevent too frequent updates to disk and similar stuff, and that might help.

Bye,
    Oleg
